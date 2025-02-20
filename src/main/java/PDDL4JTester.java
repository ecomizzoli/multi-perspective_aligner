import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.deckfour.xes.model.XTrace;

import translations.IOManager;

public class PDDL4JTester {
  
  public static void main(String[] args) {
    if (args.length != 2) {
      String errMsg = "Incorrect number of parameters. Correct usage:\n" +
      "1: domain file name\n" + 
      "2: problem file name";

      throw new Error(errMsg);
    }

    String domain;
    String problem;
    try {
      domain = new String(Files.readAllBytes(Paths.get(args[0])));
      problem = new String(Files.readAllBytes(Paths.get(args[1])));
    } catch (IOException e) {
      System.err.println("Unable to read file!");
      e.printStackTrace();
      return;
    }

    ArrayList<String> l = new ArrayList<>();
    l.add(problem);
    Planner planner = new Planner(domain, l);
    ArrayList<String> alignments = planner.readProblems();
    // log.repairTraces(alignments, model.getActivities());
    // ArrayList<XTrace> originalXTraces = log.buildOriginalXTraces();
    // ArrayList<XTrace> repairedXTraces = log.buildRepairedXTraces();
    // IOManager.getInstance().exportLog(log);

  }
}
