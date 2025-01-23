package model;

import java.util.ArrayList;
import java.util.Arrays;

public class Attribute {
  
  private final String name;
  private String type;
  private double minValue, maxValue;
  private String[] values;
  
  public Attribute(String name) {
    this.name = name;
  }
  
  
  
  
  
  
  
  //Section: Evaluation and set up the attribute
  public void setEnumAttribute(String[] values) {
    this.type = "enum";
    this.values = values;
  }
  
  public void setNumericAttribute(String type, double min, double max) {
    this.type = type;
    this.minValue = min;
    this.maxValue = max;
  }
  
  public String isConditionValid(Condition condition) {
    String result = type.equals("enum")? isEnumConditionValid(condition) : isNumericConditionValid(condition);
    return (result.equals("true") || result.equals("false"))? result : name + " " + result;
  }
  
  
  //Section: Enum condition validation
  private String isEnumConditionValid(Condition condition) {
    ArrayList<String> conditionStrings = condition.getValues();
    return condition.isIncluded()? enumContainedValid(conditionStrings) : enumNotContainedValid(conditionStrings);
  }
  
  private String enumContainedValid(ArrayList<String> conditionStrings) {
    ArrayList<String> valid = new ArrayList<>();
    for (String conditionString : conditionStrings) {
      if (Arrays.asList(values).contains(conditionString)) {
        valid.add(conditionString);
      }
    }
    String result = evaluateValidList(conditionStrings, valid);
    if (result.equals("true") || result.equals("false")) {
      return result;
    } else {
      return valid.size() > 1? "is in " + result : "is " + result;
    }
  }
  
  private String evaluateValidList(ArrayList<String> conditionStrings, ArrayList<String> valid) {
    if (valid.isEmpty()) {
      return "false";
    } else if (valid.size() == conditionStrings.size()) {
      return "true";
    } else {
      return String.join(", ", valid);
    }
  }
  
  private String enumNotContainedValid(ArrayList<String> conditionStrings) {
    ArrayList<String> notValid = new ArrayList<>(conditionStrings);
    for (String value : values) {
      if (conditionStrings.contains(value) && !notValid.contains(value)) {
        notValid.add(value);
      }
    }
    return notValid.size() == values.length? "false" : "true";
  }
  
  
  //Section: Numeric condition validation
  private String isNumericConditionValid(Condition condition) {
    if (isValueValid(condition.getStart()) || isValueValid(condition.getEnd())) {
      return "true";
    } else if (condition.getStart() < maxValue && condition.getEnd() == Double.POSITIVE_INFINITY) {
      return ">= " + minValue;
    } else if (condition.getEnd() > minValue && condition.getStart() == Double.NEGATIVE_INFINITY) {
      return "<= " + maxValue;
    } else if (condition.getStart() == minValue || condition.getEnd() == minValue) {
      return evaluateLowerBoundValid(condition);
    } else if (condition.getStart() == maxValue || condition.getEnd() == maxValue) {
      return evaluateUpperBoundValid(condition);
    } else {
      return "false";
    }
  }
  
  private boolean isValueValid(double value) {
    return (minValue < value && value < maxValue);
  }
  
  private String evaluateLowerBoundValid(Condition condition) {
    if (condition.getEnd() == Double.POSITIVE_INFINITY || condition.getStart() == condition.getEnd()) {
      return "true";
    } else {
      return condition.isClosedRight()? "true" : "false";
    }
  }
  
  private String evaluateUpperBoundValid(Condition condition) {
    if (condition.getStart() == Double.NEGATIVE_INFINITY || condition.getStart() == condition.getEnd()) {
      return "true";
    } else {
      return condition.isClosedLeft()? "true" : "false";
    }
  }
  
  @Override
  public boolean equals(Object o) {
    return o instanceof Attribute attribute && this.name.equals(attribute.getName());
  }
  
  @Override
  public String toString() {
    StringBuilder stringBuilder = new StringBuilder(name + " of type " + type + " with ");
    if (type.equals("enum")) {
      stringBuilder.append("values: ").append(Arrays.toString(values)).append("\n");
    } else {
      stringBuilder.append("bounds: [").append(minValue).append(", ").append(maxValue).append("]\n");
    }
    return stringBuilder.append("\n").toString();
  }
  
  public String getName() {
    return name;
  }
  
  public String getType() {
    return type;
  }
}