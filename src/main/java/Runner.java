import log.LogFile;
import model.DeclareModel;
import translations.DeclareToLTL;
import translations.IOManager;
import translations.PDDLGenerator;

import java.util.ArrayList;

public class Runner {
  
  public static void main(String[] args) throws Exception {
    findAlignments(20);
  }
  
  public static void findAlignments(int length) throws Exception {

    // Read model and logs to find ltl formula
    IOManager ioManager = IOManager.getInstance();
    
    DeclareModel model = ioManager.readDeclareModel("recap-model.decl");
    model.assignCosts(ioManager.readCostModel("testing-costModel.txt"));
    LogFile log = ioManager.readLog("recap-log.xes", model);
    //System.out.println(log);
    
    
    ioManager.exportModel(model);
    String ltlFormula = new DeclareToLTL(model).translateModelToLTL();
    
    if (!ltlFormula.isBlank()) {
      // If formula exists, define and write PDDL problems.
      System.out.println(ltlFormula);
      PDDLGenerator pddlGenerator = new PDDLGenerator(model, ltlFormula);
      String domain = pddlGenerator.defineDomain();
      ArrayList<String> problems = log.defineProblems(pddlGenerator);
      int i = 1;
      for (String problem : problems) {
        IOManager.getInstance().exportProblemPDDL(problem, i);
        i++;
      }
      IOManager.getInstance().exportDomainPDDL(domain);

      // For each problem, find sequence of actions to solve the trace.
      Planner planner = new Planner(domain, problems);
      ArrayList<String> alignments = planner.readProblems();
      log.repairTraces(alignments, model.getActivities());
      //ArrayList<XTrace> originalXTraces = log.buildOriginalXTraces();
      //ArrayList<XTrace> repairedXTraces = log.buildRepairedXTraces();
      IOManager.getInstance().exportLog(log);
    }
  }
}




/* - Extras
public static void modifyLog(int length) {
  StringBuilder newLog = new StringBuilder();
  
  File log = new File(inputFolder + "length_"+ length +".xes");
  try (Scanner scanner = new Scanner(log)) {
    while (scanner.hasNextLine()) {
      String line = scanner.nextLine();
      if (line.contains("activity ")) {
        String[] tokens = line.split("activity ");
        newLog.append(tokens[0]).append("activity").append(tokens[1]).append("\n");
      } else {
        newLog.append(line).append("\n");
      }
    }
  } catch (IOException e) {
    e.printStackTrace();
    System.out.println("Error reading the cost model");
  }
  
  String result = newLog.toString();
  result = result.replaceAll("activity17", "activity7");
  result = result.replaceAll("activity16", "activity6");
  result = result.replaceAll("activity15", "activity5");
  result = result.replaceAll("activity14", "activity4");
  result = result.replaceAll("activity13", "activity3");
  result = result.replaceAll("activity12", "activity2");
  result = result.replaceAll("activity11", "activity1");
  
  try (FileWriter fileWriter = new FileWriter(outputFolder + "length_" + length + ".xes")) {
    fileWriter.write(result);
  } catch (IOException e) {
    System.out.println("Error creating the model file");
  }
}

private static void createLog() {
  StringBuilder builder = new StringBuilder();
  builder.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n" +
  "<!-- This file has been generated with the OpenXES library. It conforms -->\n" +
  "<!-- to the XML serialization of the XES standard for log storage and -->\n" +
  "<!-- management. -->\n" +
  "<!-- XES standard version: 1.0 -->\n" +
  "<!-- OpenXES library version: 1.0RC7 -->\n" +
  "<!-- OpenXES is available from http://www.openxes.org/ -->\n" +
  "<log xes.version=\"1.0\" xes.features=\"nested-attributes\" openxes.version=\"1.0RC7\">\n" +
  "\t<extension name=\"Organizational\" prefix=\"org\" uri=\"http://www.xes-standard.org/org.xesext\"/>\n" +
  "\t<extension name=\"Time\" prefix=\"time\" uri=\"http://www.xes-standard.org/time.xesext\"/>\n" +
  "\t<extension name=\"Lifecycle\" prefix=\"lifecycle\" uri=\"http://www.xes-standard.org/lifecycle.xesext\"/>\n" +
  "\t<extension name=\"Semantic\" prefix=\"semantic\" uri=\"http://www.xes-standard.org/semantic.xesext\"/>\n" +
  "\t<extension name=\"Concept\" prefix=\"concept\" uri=\"http://www.xes-standard.org/concept.xesext\"/>\n" +
  "\t<string key=\"concept:name\" value=\"MyLog\"/>\n" +
  "\t<string key=\"lifecycle:model\" value=\"standard\"/>\n");
  builder.append("\t<trace>\n");
  builder.append("\t\t<string key=\"concept:name\" value=\"Test\"/>\n");
  for (int i = 0; i < 100; i++) {
    String activityName = getActivityName();
    builder.append(getActivityByName(activityName));
  }
  builder.append("\t</trace>\n");
  builder.append("</log>");
  //System.out.println(builder.toString());
  try (FileWriter fileWriter = new FileWriter("test100log.xes")) {
    fileWriter.write(builder.toString());
  } catch (IOException e) {
    System.out.println("Error creating the logg file");
  }
}

private static  String getActivityByName(String activityName) {
  StringBuilder builder = new StringBuilder("\t\t<event>\n");
  builder.append("\t\t\t<string key=\"concept:name\" value=\"").append(activityName).append("\"/>\n");
  if (activityName.equals("a")) {
    int randAx = (int) (Math.random() * 1050);
    int randAy = (int) (Math.random() * 1050);
    builder.append("\t\t\t<string key=\"ax\" value=\"").append(randAx).append("\"/>\n");
    builder.append("\t\t\t<string key=\"ay\" value=\"").append(randAy).append("\"/>\n");
  } else if (activityName.equals("b")) {
    double randBs = (Math.random() * 510.75) + -510.25;
    double randBt = (Math.random() * 510) + -510.25;
    builder.append("\t\t\t<string key=\"bs\" value=\"").append(randBs).append("\"/>\n");
    builder.append("\t\t\t<string key=\"bt\" value=\"").append(randBt).append("\"/>\n");
  } else if (activityName.equals("c")) {
    String[] names = new String[]{"axel", "susi", "csaba", "empty"};
    String[] surs = new String[]{"mezini", "loddi", "toth"};
    int randNam = (int) (Math.random() * 4);
    int randSur = (int) (Math.random() * 3);
    builder.append("\t\t\t<string key=\"name\" value=\"").append(names[randNam]).append("\"/>\n");
    builder.append("\t\t\t<string key=\"surname\" value=\"").append(surs[randSur]).append("\"/>\n");
  } else if (activityName.equals("d")) {
    String[] bool = new String[]{"true", "false", "maybe"};
    int gradRand = (int) (Math.random() * 10);
    int boolRand = (int) (Math.random() * 3);
    builder.append("\t\t\t<string key=\"grade\" value=\"").append(gradRand).append("\"/>\n");
    builder.append("\t\t\t<string key=\"boolean\" value=\"").append(bool[boolRand]).append("\"/>\n");
  }
  return builder.append("\t\t</event>\n").toString();
}

private static String getActivityName() {
  String[] names = new String[]{"a", "b", "c", "d", "e"};
  int rand = (int) (Math.random() * 5) ;
  return names[rand];
}
 */
