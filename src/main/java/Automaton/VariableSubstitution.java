package Automaton;

public class VariableSubstitution {
  public String variableName;
  public String categoryName;

  @Override
  public boolean equals(Object o) {
    if (!(o instanceof VariableSubstitution)) return false;

    VariableSubstitution that = (VariableSubstitution) o;
    if (!this.variableName.equals(that.variableName)) return false;
    if (!this.categoryName.equals(that.categoryName)) return false;

    return true;
  }
}
