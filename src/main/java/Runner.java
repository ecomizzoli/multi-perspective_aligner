import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import Automaton.VariableSubstitution;
import log.LogFile;
import model.DeclareModel;
import translations.IOManager;
import translations.PDDLGenerator;

public class Runner {
  
  public static void main(String[] args) throws Exception {
    findAlignments(20); // Length?
  }
  
  public static void findAlignments(int length) throws Exception {

    // Read model and logs to find ltl formula
    IOManager ioManager = IOManager.getInstance();
    
    DeclareModel model = ioManager.readDeclareModel("prob2decl.decl"); // OKAY!
    model.assignCosts(ioManager.readCostModel("costModel.txt")); // OKAY!

    Map<String, Integer> variableAssignments = ioManager.readVariableAssignments("variable_values.txt");
    Set<VariableSubstitution> substitutions = ioManager.readVariablesSubstitutions("variable_substitutions.txt");

    System.out.println("Model: " + model);

    String fileName = "50events.xes";
    LogFile log = ioManager.readLog(fileName, model); // OKAY!
    
    ioManager.exportModel(model);

    // If formula exists, define and write PDDL problems.
    // PDDLGenerator pddlGenerator = new PDDLGenerator(model, ltlFormula);
    PDDLGenerator pddlGenerator = new PDDLGenerator(model);
    String domain = pddlGenerator.defineDomain();
    ArrayList<String> problems = log.generateProblems(pddlGenerator, variableAssignments, substitutions);
    int i = 1;
    for (String problem : problems) {
      IOManager.getInstance().exportProblemPDDL(problem, i);
      i++;
    }
    IOManager.getInstance().exportDomainPDDL(domain);
  }
}

