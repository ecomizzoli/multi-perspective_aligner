package model;

import jdk.jshell.JShell;
import jdk.jshell.SnippetEvent;
import org.apache.commons.collections15.map.CaseInsensitiveMap;

import java.util.*;

public class Activity {
  
  private final String name;
  private int addCost = 1, removeCost = 1, replaceCost = 1, extraWrongCost = 0, extraMissingCost = 0;
  private final ArrayList<Attribute> attributes;
  private Map<String, ArrayList<String>> partitions;
  
  public Activity(String name) {
    this.name = name;
    this.attributes = new ArrayList<>();
  }
  
  
  //Section: Activity setting up
  public void addAttribute(Attribute attribute) {
    if (!attributes.contains(attribute)) {
      attributes.add(attribute);
    }
  }
  
  public void assignActionCosts(int[] costs) {
    this.addCost = costs[0];
    this.removeCost = costs[1];
    this.replaceCost = costs[2];
    this.extraWrongCost = costs[3];
    this.extraMissingCost = costs[4];
  }
  
  
  
  
  
  
  
  
  //Section: creation of the partitions
  public void decomposeAttributes() {
    ArrayList<ArrayList<String>> decompositions = new ArrayList<>();
    for (Attribute attribute : attributes) {
      ArrayList<String> decomposition = attribute.decomposeAttribute();
      decompositions.add(decomposition);
    }
    intersect(decompositions);
  }
  
  private void intersect(ArrayList<ArrayList<String>> atoms) {
    ArrayList<ArrayList<String>> temporary = initializeMultiArray(atoms);
    for (int attrCount = 1; attrCount < atoms.size(); attrCount++) {
      int attributeLength = atoms.get(attrCount).size();
      if (attributeLength > 0) {
        extendArray(temporary, attributeLength);
        int quotient = temporary.size() / attributeLength;
        for (int i = 0; i < temporary.size(); i++) {
          String atomToAdd = atoms.get(attrCount).get((i / quotient));
          temporary.get(i).add(atomToAdd);
        }
      }
    }
    this.partitions = buildPartitionMap(temporary);
  }
  
  private ArrayList<ArrayList<String>> initializeMultiArray(ArrayList<ArrayList<String>> atoms) {
    ArrayList<ArrayList<String>> multiDimension = new ArrayList<>();
    if (!atoms.isEmpty()) {
      for (String atom : atoms.get(0)) {
        multiDimension.add(new ArrayList<>(Collections.singleton(atom)));
      }
    }
    return multiDimension;
  }
  
  private void extendArray(ArrayList<ArrayList<String>> input, int times) {
    int initialSize = input.size();
    for (int a = 1; a < times; a++) {
      for (int i = 0; i < initialSize; i++) {
        ArrayList<String> line = new ArrayList<>(input.get(i));
        input.add(line);
      }
    }
  }
  
  private Map<String, ArrayList<String>> buildPartitionMap(ArrayList<ArrayList<String>> listOfLists) {
    Map<String, ArrayList<String>> map = new CaseInsensitiveMap<>();
    int counter = 1;
    for (ArrayList<String> list : listOfLists) {
      map.put(name + "_p" + counter, list);
      counter++;
    }
    return map;
  }
  
  
  //Section: Check Partition - DeclareConstraint
  public String getAcceptedPartitions(String condition, ArrayList<Condition> conditionsList) {
    if (conditionsList.isEmpty()) {
      if (attributes.isEmpty()) {
        return name;
      } else {
        return completePartitioningAsString();
      }
    } else {
      return findAcceptedPartitions(condition, conditionsList);
    }
  }
  
  private String findAcceptedPartitions(String conditionString, ArrayList<Condition> conditionsList) {
    StringBuilder builder = new StringBuilder();
    for (Map.Entry<String, ArrayList<String>> partition : partitions.entrySet()) {
      String newCondition = conditionString.replaceAll("a\\.|t\\.|A\\.|T\\.","");
      for (Condition condition : conditionsList) {
        String accepted = isConditionContained(condition, partition.getValue());
        newCondition = newCondition.replace(condition.getString(), accepted);
      }
      SnippetEvent result = evaluateString(newCondition);
      if (Boolean.parseBoolean(result.value())) {
        builder.append(partition.getKey()).append(" or ");
      } else if (result.status().name().equals("REJECTED")) {
        return null;
      }
    }
    return builder.isEmpty()? null : builder.substring(0, builder.length() - 4);
  }
  
  private String isConditionContained(Condition condition, ArrayList<String> partition) {
    for (String subPartition : partition) {
      String attributeName = condition.getString().split(" ")[0];
      if (subPartition.contains(attributeName)) {
        if (condition.getType().equals("integer") || condition.getType().equals("float")) {
          String[] subPartitionTokens = subPartition.split(" ");
          return String.valueOf(condition.isNumericContained(subPartitionTokens));
        } else {
          String originalValue = subPartition.split(" is ")[1];
          return String.valueOf(condition.isEnumContained(originalValue));
        }
      }
    }
    return "not implemented";
  }
  
  private SnippetEvent evaluateString(String string) {
    JShell js = JShell.create();
    List<SnippetEvent> list = js.eval(string.replace("and", "&&").replace("or", "||"));
    js.close();
    return list.get(0);
  }
  
  public String completePartitioningAsString() {
    StringBuilder builder = new StringBuilder();
    for (String partitionName : partitions.keySet()) {
      builder.append(partitionName).append(" or ");
    }
    return builder.isEmpty()? name : builder.substring(0, builder.length() - 4);
  }
  
  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("> My attributes are: \n");
    for (Attribute attribute : attributes) {
      builder.append(attribute);
    }
    builder.append("The followings are my partitions: ").append(partitions).append("\n");
    builder.append("With following costs: Add -> ").append(addCost).append(", Remove -> ").append(removeCost)
    .append(", Replace -> ").append(replaceCost).append(", Extra cost for wrong attributes -> ")
    .append(extraWrongCost).append(", Extra cost for missing attributes -> ").append(extraMissingCost);
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
  
  public ArrayList<Attribute> getAttributes() {
    return attributes;
  }
  
  public Map<String, ArrayList<String>> getPartitions () {
    return partitions;
  }
  
  public int getAddCost() {
    return addCost;
  }
  
  public int getRemoveCost() {
    return removeCost;
  }
  
  public int getReplaceCost() {
    return replaceCost;
  }
  
  public int getMissingCost() {
    return replaceCost + extraMissingCost;
  }
  
  public int getWrongCost() {
    return replaceCost + extraWrongCost;
  }
}