package Automaton;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import model.Condition;
import model.DeclareConstraint;

public class Automaton {
  
  private final String STATE_PREFIX;
  private final Collection<String> ACTIVITY_NAMES;
  private List<State> states = new ArrayList<>();
  private List<Transition> transitions = new ArrayList<>();

  public Automaton(Collection<String> activityNames, String statePrefix, DeclareConstraint constraint) {
    this.ACTIVITY_NAMES = activityNames;
    this.STATE_PREFIX = statePrefix;
    
    State s1 = new State(this.STATE_PREFIX + 1)
      .initial();

    State s2 = new State(this.STATE_PREFIX + 2);

    State s3 = new State(this.STATE_PREFIX + 3);

    this.states.add(s1);
    this.states.add(s2);
    this.states.add(s3);

    Transition t1;
    Transition t2;
    switch (constraint.getTemplate()) {
      case Absence:
        t1 = new Transition(s1, s2, constraint.getActivation(), constraint.getActivationConditions());
        this.transitions.add(t1);
        s1.goal().failure();
        break;

      case Existence:
        t1 = new Transition(s1, s2, constraint.getActivation(), constraint.getActivationConditions());
        this.transitions.add(t1);
        s2.goal();
        break;

      case Response:
        t1 = new Transition(s1, s2, constraint.getActivation(), constraint.getActivationConditions());
        t2 = new Transition(s2, s1, constraint.getTarget(), constraint.getTargetConditions());
        this.transitions.add(t1);
        this.transitions.add(t2);

        s1.goal();
        break;

      case Chain_Response:
        t1 = new Transition(s1, s2, constraint.getActivation(), constraint.getActivationConditions());
        t2 = new Transition(s2, s1, constraint.getTarget(), constraint.getTargetConditions());
        this.transitions.add(t1);
        this.transitions.add(t2);
        s1.goal();
        s3.failure();

        // Opposite of target condition brings the automaton to another state.
        List<Condition> oppositeConditions = this.getOppositeConditions(constraint.getTargetConditions());
        this.transitions.add(new Transition(s2, s3, constraint.getTarget(), oppositeConditions));

        // All other activities of target brings the automaton to another state.
        this.ACTIVITY_NAMES.forEach(x -> {
          this.transitions.add(new Transition(s2, s3, x, null));
        });
        break;

      case Exclusive_Choice:
        State s4 = new State(this.STATE_PREFIX + 4).failure();
        this.states.add(s4);
        s2.goal();
        s3.goal();
        this.transitions.add( new Transition(s1, s2, constraint.getActivation(), constraint.getActivationConditions()) );
        this.transitions.add( new Transition(s1, s3, constraint.getTarget(), constraint.getTargetConditions()) );
        this.transitions.add( new Transition(s2, s4, constraint.getActivation(), constraint.getActivationConditions()) );
        this.transitions.add( new Transition(s3, s4, constraint.getTarget(), constraint.getTargetConditions()) );
        break;

      default:
        break;
    }
  }
  private List<Condition> getOppositeConditions(List<Condition> conditionsToNegate) {
    List<Condition> negatedConditions = new ArrayList<>();

    for (Condition c : conditionsToNegate) {
      negatedConditions.add(new Condition(c.activity, c.parameterName, c.getNegatedCondition(), c.value));
    }
    return negatedConditions;
  }

  public List<State> getStates() {
    return this.states;
  }
  public List<Transition> getTransitions() {
    return this.transitions;
  }
}
