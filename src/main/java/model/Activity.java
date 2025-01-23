package model;

import java.util.*;

public class Activity {
  
  private final String name;
  private Set<Attribute> attributes;
  private Map<Attribute, Set<Integer>> substitutionValues; // TODO Instead of integer, should be generally Value
  
  public Activity(String name) {
    this.name = name;
    this.attributes = new HashSet<>();
  }
  
  
  //Section: Activity setting up
  public void addAttribute(Attribute attribute) {
    if (!attributes.contains(attribute)) {
      attributes.add(attribute);
    }
  }
  
  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("> My attributes are: \n");
    for (Attribute attribute : attributes) {
      builder.append(attribute);
    }
    builder.append("\n");
    return builder.toString();
  }
  
  public Attribute getAttribute(String name) {
    for (Attribute attribute : attributes) {
      if (attribute.getName().equals(name)) {
        return attribute;
      }
    }
    return null;
  }
  
  public String getName() {
    return name;
  }

  public Set<Attribute> getAttributes() {
    return this.attributes;
  }
}