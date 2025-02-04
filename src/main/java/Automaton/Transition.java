package Automaton;

import java.util.ArrayList;
import java.util.List;

import model.Condition;
import model.OperatorType;

public class Transition {
  private State activationState;
  private State targetState;
  private String activity;
  private List<Condition> originalConditions;
  private List<Condition> reformedConditions;

  public Transition(State state1, State state2, String activity, List<Condition> conditions) {
    this.activationState = state1;
    this.targetState = state2;
    this.activity = activity;
    this.originalConditions = conditions;
    this.reformedConditions = this.reformConditions(this.originalConditions);
  }

  private List<Condition> reformConditions(List<Condition> conditions) {
    if (conditions == null) return null;

    List<Condition> newList = new ArrayList<>();
    for (Condition condition : conditions) {
      
      // BIGGER OR LESS NEED TWO CONDITIONS IN OUR PDDL
      switch (condition.operator) {
        case BIGGER:
          // > is equal to >= && !=
          newList.add(new Condition(condition.activity, condition.parameterName, OperatorType.BIGGER_OR_EQUAL, condition.value));
          newList.add(new Condition(condition.activity, condition.parameterName, OperatorType.NOT_EQUAL, condition.value));
          break;
        case LESS:
          newList.add(new Condition(condition.activity, condition.parameterName, OperatorType.LESS_OR_EQUAL, condition.value));
          newList.add(new Condition(condition.activity, condition.parameterName, OperatorType.NOT_EQUAL, condition.value));
          break;
        default:
          newList.add(condition);
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
