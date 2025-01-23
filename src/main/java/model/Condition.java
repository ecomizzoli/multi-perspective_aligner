package model;

public class Condition {
  
  public String activity;
  public String parameterName;
  public OperatorType operator;
  public Double value;

  public Condition(String activityName, String parameterName, OperatorType operator, Double value) {
    this.activity = activityName;
    this.parameterName = parameterName;
    this.operator = operator;
    this.value = value;
  }
}