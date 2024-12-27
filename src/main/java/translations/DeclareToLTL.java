package translations;

import model.DeclareConstraint;
import model.DeclareModel;
import model.DeclareTemplate;
import org.processmining.ltl2automaton.plugins.formula.DefaultParser;
import org.processmining.ltl2automaton.plugins.formula.Formula;

public class DeclareToLTL {
  
  private final DeclareModel model;
  private static final String OR_OPERATOR = "\\/", AND_OPERATOR = "/\\";
  
  public DeclareToLTL(DeclareModel declareModel) {
    this.model = declareModel;
  }
  
  //TODO: provare con ltl vuota
  //Section: Translation of declare model constraints into LTL formula
  public String translateModelToLTL() {
    StringBuilder formulaBuilder = new StringBuilder();
    for (DeclareConstraint constraint : model.getDeclareConstraints()) {
      DeclareTemplate template = constraint.getTemplate();
      String activationString = constraint.defineActivationPartitioning(model.getActivities());
      String targetString = constraint.defineTargetPartitioning(model.getActivities());
      if (isConstraintAcceptable(template.getFlag(), activationString, targetString)) {
        String newFormula = addToFormula(template, activationString, targetString);
        formulaBuilder.append(newFormula).append(" " + AND_OPERATOR + " ");
      }
    }
    return formulaBuilder.isEmpty()? formulaBuilder.toString() : formulaBuilder.substring(0, formulaBuilder.length() - 4);
  }
  
  private boolean isConstraintAcceptable(String flag, String aPartition, String tPartition) {
    return flag.equals("unary")? aPartition != null : aPartition != null && tPartition != null;
  }
  
  private String addToFormula(DeclareTemplate template, String activationString, String targetString) {
    String dataFlag = template.getFlag();
    String name = template.getTemplateName().toLowerCase();
    return switch (dataFlag) {
      case "unary" -> formatFormula(translateUnaryConstraint(activationString, name));
      case "binary" -> formatFormula(translateBinaryConstraint(activationString, targetString, name));
      case "agnostic" -> formatFormula(translateAgnosticConstraint(activationString, targetString, name));
      default -> "not implemented";
    };
  }
  
  private String formatFormula(String formula) {
    return addParenthesis(formula).replace(" or ", " " + OR_OPERATOR + " ");
  }
  
  private String addParenthesis(String string) {
    return "(" + string + ")";
  }
  
  
  //Section: Translation of Constraint
  private String translateUnaryConstraint(String aPartition, String name) {
    String aString = addParenthesis(aPartition);
    
    return switch (name) {
      case "existence" -> existence(aString);
      case "existence2" -> existence2(aString);
      case "existence3" -> existence3(aString);
      case "absence" -> absence(aString);
      case "absence2" -> absence2(aString);
      case "absence3" -> absence3(aString);
      case "exactly1" -> exactly1(aString);
      case "exactly2" -> exactly2(aString);
      case "init" -> init(aString);
      default -> "not implemented";
    };
  }
  
  private String translateBinaryConstraint(String aPartition, String tPartition, String name) {
    String aString = addParenthesis(aPartition);
    String tString = addParenthesis(tPartition);
    
    return switch (name) {
      case "responded existence" -> respondedExistence(aString, tString);
      case "not responded existence" -> notRespondedExistence(aString, tString);
      case "precedence" -> precedence(aString, tString);
      case "alternate precedence" -> alternatePrecedence(aString, tString);
      case "chain precedence" -> chainPrecedence(aString, tString);
      case "not precedence" -> notPrecedence(aString, tString);
      case "not chain precedence" -> notChainPrecedence(aString, tString);
      case "response" -> response(aString, tString);
      case "alternate response" -> alternateResponse(aString, tString);
      case "chain response" -> chainResponse(aString, tString);
      case "not response" -> notResponse(aString, tString);
      case "not chain response" -> notChainResponse(aString, tString);
      case "choice" -> choice(aString, tString);
      case "exclusive choice" -> exclusiveChoice(aString, tString);
      default -> "not implemented";
    };
  }
  
  private String translateAgnosticConstraint(String activator, String target, String name) {
    String aActivity = addParenthesis(activator);
    String tActivity = addParenthesis(target);
    
    return switch (name) {
      case "succession" -> succession(aActivity, tActivity);
      case "alternate succession" -> alternateSuccession(aActivity, tActivity);
      case "chain succession" -> chainSuccession(aActivity, tActivity);
      case "not succession" -> notSuccession(aActivity, tActivity);
      case "not chain succession" -> notChainSuccession(aActivity, tActivity);
      case "co-existence" -> coExistence(aActivity, tActivity);
      case "not co-existence" -> notCoExistence(aActivity, tActivity);
      default -> "not implemented";
    };
  }
  
  
  //Section: Translation of Declare templates
  private String existence(String aString) {
    return "<> " + aString;
  }
  
  private String existence2(String aString) {
    return "<>(" + aString + " /\\ X(<> " + aString + "))";
  }
  
  private String existence3(String aString) {
    return "<>(" + aString + " /\\ X(<>(" + aString + " /\\ X(<> " + aString + "))))";
  }
  
  private String absence(String aString) {
    return "!(<> " + aString + ")";
  }
  
  private String absence2(String aString) {
    return "!(<>(" + aString + " /\\ X(<>" + aString + ")))";
  }
  
  private String absence3(String aString) {
    return  "!(<>(" + aString + " /\\  X(<>(" + aString + " /\\  X(<> " + aString + ")))))";
  }
  
  private String exactly1(String aString) {
    return "<> " + aString + " /\\ !(<>(" + aString + " /\\ X(<> " + aString + ")))";
  }
  
  private String exactly2(String aString) {
    return  "<>(" + aString + " /\\ (" + aString + " -> (X(<> " + aString + ")))) /\\  " +
    "!(<>(" + aString + " /\\ (" + aString + " -> X(<>(" + aString + " /\\ " +
    "(" + aString + " -> X(<> " + aString + ")))))))";
  }
  
  private String init(String aString) {
    return aString;
  }
  
  private String respondedExistence(String aString, String tString) {
    return "<>" + aString + " -> (<> " + tString + ")";
  }
  
  private String notRespondedExistence(String aString, String tString) {
    return "<> " + aString + " -> !(<> " + tString + ")";
  }
  
  private String precedence(String aString, String tString) {
    return "!" + tString + " U " + aString + " \\/ ([](!" + tString + ")) /\\ !" + tString;
  }
  
  private String alternatePrecedence(String aString, String tString) {
    return "(((!" + tString + " U " + aString + " \\/ [](!" + tString + ")) /\\ " +
    "[]((" + tString + " -> ((!(X(" + aString + ")) /\\ !(X(!" + aString + "))) \\/ " +
    "X((!" + tString + " U " + aString + ") \\/ [](!" + tString + ")))))) /\\ !" + tString + ")";
  }
  
  private String chainPrecedence(String aString, String tString) {
    return "[]((X(" + tString + ") -> " + aString + ")) /\\ !(" + tString + ")";
  }
  
  private String notPrecedence(String aString, String tString) {
    return "[](" + aString + " -> !(<> " + tString + "))";
  }
  
  private String notChainPrecedence(String aString, String tString) {
    return "[](" + aString + " -> !(X(" + tString + ")))";
  }
  
  private String response(String aString, String tString) {
    return "[](" + aString + " -> <> " + tString + ")";
  }
  
  private String alternateResponse(String aString, String tString) {
    return "[](" + aString + " -> X(!" + aString + " U " + tString + "))";
  }
  
  private String chainResponse(String aString, String tString) {
    return  "[](" + aString + " -> X(" + tString + "))";
  }
  
  private String notResponse(String aString, String tString) {
    return "[](" + aString + " -> !(<> " + tString + "))";
  }
  
  private String notChainResponse(String aString, String tString) {
    return  "[](" + aString + " -> !(X(" + tString + ")))";
  }
  
  private String choice(String aString, String tString) {
    return "<> " + aString + " \\/ <> " + tString;
  }
  
  private String exclusiveChoice(String aString, String tString) {
    return "(<> " + aString + " \\/ <> " + tString + ") /\\ !(<> " + aString + " /\\ <> " + tString + ")";
  }
  
  private String succession(String aActivity, String tActivity) {
    return "([](" + aActivity + " -> <> " + tActivity + ")) /\\ " +
    "((!" + tActivity + " U " + aActivity + ") \\/ ([](!" + tActivity + ")) /\\ !" + tActivity + ")";
  }
  
  private String alternateSuccession(String aActivity, String tActivity) {
    return "([](" + aActivity + " -> X(!" + aActivity + " U " + tActivity + ")) /\\ " +
    "(((!" + tActivity + " U " + aActivity + ") \\/ [](!" + tActivity + ")) /\\ " +
    "[]((" + tActivity + " -> (!(X(" + aActivity + ")) /\\ !(X(!" + aActivity + ")) \\/ " +
    "X((!" + tActivity + " U " + aActivity + ") \\/ []( !" + tActivity + "))))) /\\ !" + tActivity + "))";
  }
  
  private String chainSuccession(String aActivity, String tActivity) {
    return "([](" + aActivity + " -> X(" + tActivity + "))) /\\ ([](X(" + tActivity + ") -> " + aActivity + ") /\\ !" + tActivity + ")";
  }
  
  private String notSuccession(String aActivity, String tActivity) {
    return "[](" + aActivity + " -> !(<> " + tActivity + "))";
  }
  
  private String notChainSuccession(String aActivity, String tActivity) {
    return "[](" + aActivity + " -> !(X(" + tActivity + ")))";
  }
  
  private String coExistence(String aActivity, String tActivity) {
    return "(<> " + aActivity + " -> <> " + tActivity + ") /\\ (<> " + tActivity + " -> <> " + aActivity + "))";
  }
  
  private String notCoExistence(String aActivity, String tActivity) {
    return "(<> " + aActivity + ") -> (!(<> " + tActivity + "))";
  }
}