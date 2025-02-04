package model;

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