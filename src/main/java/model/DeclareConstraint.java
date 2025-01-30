package model;

import java.util.*;

public class DeclareConstraint {
  
  private final DeclareTemplate template;
  private final String activationActivity, targetActivity;
  private String activationConditionString, targetConditionString;
  private ArrayList<Condition> activationConditionsList, targetConditionsList;
  
  public DeclareConstraint(DeclareTemplate template, String activationActivity, String activationCondition, String targetActivity, String targetCondition) {
    this.template = template;
    this.activationActivity = activationActivity;
    this.activationConditionString = activationCondition;
    this.targetActivity = targetActivity;
    this.targetConditionString = targetCondition;

    this.activationConditionsList = this.parseConditionList(activationActivity, activationCondition);
    this.targetConditionsList = this.parseConditionList(targetActivity, targetCondition);
  }
  private ArrayList<Condition> parseConditionList(String activityName, String conditionsString) {
    if (activityName == null || conditionsString == null) return null; // For unary constraints

    ArrayList<Condition> conditions = new ArrayList<>();

    if (conditionsString.contains(" or ")) { // leave spaces _or_!
      throw new Error("Conditions with OR currently unsupported!");
    }

    String[] strings = conditionsString.split("and");
    for (String str : strings) {
      str = str.strip();
      String[] stuff = str.split(" ");

      stuff[0] = stuff[0].replace("A.", "");
      stuff[0] = stuff[0].replace("T.", "");

      OperatorType o = switch(stuff[1]) {
        case ">" -> OperatorType.BIGGER;
        case ">=" -> OperatorType.BIGGER_OR_EQUAL;
        case "is" -> OperatorType.EQUAL;
        case "<>" -> OperatorType.NOT_EQUAL; // TODO Check
        case "<" -> OperatorType.LESS;
        case "<=" -> OperatorType.LESS_OR_EQUAL;
        default -> null;
      };

      stuff[2] = stuff[2].replaceAll("[a-zA-Z]", "");

      Condition c = new Condition(activityName, stuff[0], o, Integer.valueOf(stuff[2]));
      conditions.add(c);
    }

    return conditions;
  }
  
  
  //Section: Setting up the constraint and the condition lists
  public boolean assignConditionsToAttributes(Map<String, Activity> activities) {
    Activity activator = activities.get(activationActivity);
    Activity target = activities.get(targetActivity);
    return assignToAttribute(activator, activationConditionString, activationConditionsList, "activation") &&
    assignToAttribute(target, targetConditionString, targetConditionsList, "target");
  }
  
  private void addConditionToList(String condition, ArrayList<String> list, String flag) {
    if (condition.contains("!=")) {
      String combinedCondition = addNotEqualCondition(condition, list);
      updateConditionString(condition, combinedCondition, flag);
    } else {
      list.add(condition);
    }
  }
  
  
  //Section: Evaluation and addition of not equal condition
  private String addNotEqualCondition(String condition, ArrayList<String> list) {
    String conditionLeft = condition.replace("!=", "<");
    String conditionRight = condition.replace("!=", ">");
    list.add(conditionLeft);
    list.add(conditionRight);
    return "(" + conditionLeft + " or " + conditionRight + ")";
  }
  
  private void updateConditionString(String oldString, String newString, String flag) {
    if (flag.equals("activation")) {
      activationConditionString = activationConditionString.toLowerCase().replace(oldString, newString);
    } else {
      targetConditionString = targetConditionString.replace(oldString, newString);
    }
  }
  
  
  //Section: Validation of each condition
  private boolean assignToAttribute(Activity activity, String conditionString, ArrayList<Condition> conditionList, String flag) {
    ArrayList<String> subConditionsStringsList = createConditionsStringsList(conditionString, flag);
    for (String subConditionString : subConditionsStringsList) {
      if (!subConditionString.isBlank() && !validateAttribute(activity, subConditionString, conditionList, flag)) {
        return false;
      }
    }
    return true;
  }
  
  private ArrayList<String> createConditionsStringsList(String conditionString, String flag) {
    ArrayList<String> stringsList = new ArrayList<>();
    if (conditionString != null) {
      String[] conditionStrings = conditionString.replaceAll("[)(]", "").toLowerCase().split(" and | or ");
      for (String subCondition : conditionStrings) {
        addConditionToList(subCondition, stringsList, flag);
      }
    }
    return stringsList;
  }
  
  private boolean validateAttribute(Activity activity, String subConditionString, ArrayList<Condition> conditionList, String flag) {
    Attribute attribute = activity.getAttribute(subConditionString.split("[. ]")[1]);
    if (attribute != null && conditionMatchesType(attribute.getType(), subConditionString)) {
      // validateCondition(attribute, subConditionString, conditionList, flag);
      return true;
    } else {
      return false;
    }
  }
  
  private boolean conditionMatchesType(String type, String conditionString) {
    return ((type.equals("integer") || type.equals("float")) && Arrays.stream(new String[]{"=","<",">"}).anyMatch(conditionString::contains)) ||
    (type.equals("enum") && Arrays.stream(new String[]{" is "," in "}).anyMatch(conditionString::contains));
  }

  public String getActivation() {
    return this.activationActivity;
  }
  public String getTarget() {
    return this.targetActivity;
  }
  public List<Condition> getActivationConditions() {
    return this.activationConditionsList;
  }
  public List<Condition> getTargetConditions() {
    return this.targetConditionsList;
  }
  
  @Override
  public String toString() {
    return "[template=" + template + ", activationActivity=" + activationActivity + ", activationCondition=" + activationConditionString
    + ", targetActivity=" + targetActivity + ", targetCondition=" + targetConditionString + "]";
  }
  
  public DeclareTemplate getTemplate() {
    return template;
  }
}