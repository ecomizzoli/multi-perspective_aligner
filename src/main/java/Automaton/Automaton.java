package Automaton;

import java.util.ArrayList;
import java.util.List;

import model.Condition;
import model.DeclareConstraint;
import model.OperatorType;

public class Automaton {
  
  private final String STATE_PREFIX;
  private List<State> states;
  private List<Transition> transitions;

  public Automaton(String statePrefix, DeclareConstraint constraint) {
    
    // Do stuff with given constraint that creates states and transitions.
    this.STATE_PREFIX = statePrefix;

    // TODO Temp. Essentially an absence
    int index = 1;
    State s1 = new State();
    s1.isInitial = true;
    s1.isFinal = true;
    s1.name = this.STATE_PREFIX + index;
    index++;

    State s2 = new State();
    s2.isFailure = true;
    s2.name = this.STATE_PREFIX + index;
    index++;

    List<Condition> conditions = new ArrayList<>();
    // How do you get the condition for the activation?
    conditions.add(new Condition("a1", "int", OperatorType.BIGGER_OR_EQUAL, Double.valueOf(30)));
    Transition t = new Transition(s1, s2, constraint.getActivation(), conditions);

    states = new ArrayList<>();
    states.add(s1);
    states.add(s2);

    transitions = new ArrayList<>();
    transitions.add(t);
  }

  public List<State> getStates() {
    return this.states;
  }
  public List<Transition> getTransitions() {
    return this.transitions;
  }
}
