package Automaton;

import java.util.ArrayList;
import java.util.List;

import model.Activity;
import model.Condition;
import model.OperatorType;

public class Transition {
  private State activationState;
  private State targetState;
  private String activity;
  private List<Condition> originalConditions;
  private List<Condition> reformedConditions;

  public Transition(State a1, State a2, String a, List<Condition> conditions) {
    this.activationState = a1;
    this.targetState = a2;
    this.activity = a;
    this.originalConditions = conditions;
    this.reformedConditions = this.reformConditions(this.originalConditions);
  }

  private List<Condition> reformConditions(List<Condition> conditions) {
    List<Condition> newList = new ArrayList<>();

    for (Condition condition : conditions) {
      
      switch (condition.operator) {
        case BIGGER_OR_EQUAL:
          
      }
    }

    return newList;
  }

  public State getActiviationState() {
    return this.activationState;
  }
  public State getTargetState() {
    return this.targetState;
  }
  public String getActivity() {
    return this.activity;
  }
  public List<Condition> getReformedConditions() {
    return reformedConditions;
  }
}
