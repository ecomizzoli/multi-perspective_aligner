package Automaton;

public class State {
  public String name;
  public boolean isInitial;
  public boolean isGoal;
  public boolean isFailure;

  public State(String name) {
    this.name = name;
  }
  public State initial() {
    this.isInitial = true;
    return this;
  }
  public State goal() {
    this.isGoal = true;
    return this;
  }
  public State failure() {
    this.isFailure = true;
    return this;
  }

}
