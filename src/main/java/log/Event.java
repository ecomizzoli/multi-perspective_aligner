package log;

import model.Activity;
import model.Attribute;
import org.deckfour.xes.extension.std.XConceptExtension;
import org.deckfour.xes.factory.XFactoryNaiveImpl;
import org.deckfour.xes.model.XAttribute;
import org.deckfour.xes.model.XAttributeMap;
import org.deckfour.xes.model.XEvent;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

public class Event {
  
  private XEvent xEvent;
  private String state;
  private Map<String, String> attributes;
  
  public Event(XEvent event, Activity modelActivity) {
    this.xEvent = event;
    this.state = defineState(modelActivity);
  }
  
  public Event(String state, Activity activity) {
    this.state = state;
    ArrayList<String> activityPartition = activity.getPartitions().get(state);
    XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
    this.xEvent = factory.createEvent();
    XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
    initializeNewEvent(activityPartition, factory, activity);
  }
  
  public Event(String state, Activity activity, XAttributeMap oldAttributes) {
    this.state = state;
    ArrayList<String> activityPartition = activity.getPartitions().get(state);
    XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
    this.xEvent = factory.createEvent(copyAttributeMap(oldAttributes, factory));
    XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
    initializeNewRelatedEvent(activityPartition, factory, activity);
  }
  
  public Event(Event oldEvent, String partitionName, Activity activity) {
    this.state = partitionName;
    ArrayList<String> activityPartition = activity.getPartitions().get(partitionName);
    XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
    XEvent oldXEvent = oldEvent.getxEvent();
    this.xEvent = factory.createEvent(copyAttributeMap(oldXEvent.getAttributes(), factory));
    XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
    adaptExistingEvent(activityPartition, factory, activity);
  }
  
  private String defineState(Activity activity) {
    ArrayList<Attribute> activityAttributes = activity.getAttributes();
    if (activityAttributes.isEmpty()) {
      return activity.getName();
    } else {
      for (Map.Entry<String, ArrayList<String>> partition : activity.getPartitions().entrySet()) {
        ArrayList<Boolean> validValues = new ArrayList<>();
        for (Attribute attribute : activityAttributes) {
          if (!xEvent.getAttributes().containsKey(attribute.getName())) {
            return activity.getName() + "_missing";
          }
          validValues.add(getPartitionValidity(xEvent.getAttributes().get(attribute.getName()), partition.getValue(), attribute.getType()));
        }
        if (!validValues.isEmpty() && !validValues.contains(false)) {
          return partition.getKey();
        }
      }
    }
    return activity.getName() + "_wrong";
  }
  
  private boolean getPartitionValidity(XAttribute eventAttribute, ArrayList<String> partition, String type) {
    if (type != null) {
      for (String part : partition) {
        if (type.equals("enum") && part.contains(eventAttribute.getKey())) {
          return eventAttribute.toString().equals(part.split(" is ")[1]);
        } else if ((type.equals("integer") || type.equals("float")) && part.contains(eventAttribute.getKey())) {
          return isNumberInRange(part.split(" "), Double.parseDouble(eventAttribute.toString()));
        }
      }
    }
    return false;
  }
  
  private boolean isNumberInRange(String[] partitionParts, double value) {
    if (partitionParts[1].equals("<")) {
      if (partitionParts[3].equals("<")) {
        return Double.parseDouble(partitionParts[0]) < value && value < Double.parseDouble(partitionParts[4]);
      } else {
        return Double.parseDouble(partitionParts[0]) < value && value <= Double.parseDouble(partitionParts[4]);
      }
    } else {
      if (partitionParts[3].equals("<")) {
        return Double.parseDouble(partitionParts[0]) <= value && value < Double.parseDouble(partitionParts[4]);
      } else{
        return Double.parseDouble(partitionParts[0]) <= value && value <= Double.parseDouble(partitionParts[4]);
      }
    }
  }
  
  private void initializeNewEvent(ArrayList<String> partition, XFactoryNaiveImpl factory, Activity activity) {
    if (partition != null) {
      for (String string : partition) {
        if (string.contains(" is ")) {
          String[] tokens = string.split(" is ");
          xEvent.getAttributes().put(tokens[0], factory.createAttributeLiteral(tokens[0], tokens[1], null));
        } else {
          String[] tokens = string.split(" ");
          String attributeType = activity.getAttribute(tokens[2]).getType();
          XAttribute newAttribute = getRandomAttrValue(tokens, attributeType, factory);
          xEvent.getAttributes().put(tokens[2], newAttribute);
        }
      }
    }
  }
  
  private void initializeNewRelatedEvent(ArrayList<String> partition, XFactoryNaiveImpl factory, Activity activity) {
    for (String subPartition : partition) {
      if (subPartition.contains(" is ")) {
        String[] partitionTokens = subPartition.split(" is ");
        xEvent.getAttributes().put(partitionTokens[0], factory.createAttributeLiteral(partitionTokens[0], partitionTokens[1], null));
      } else {
        String[] partitionTokens = subPartition.split(" ");
        String attributeType = activity.getAttribute(partitionTokens[2]).getType();
        String existingNum = xEvent.getAttributes().get(partitionTokens[2]).toString();
        adaptNumeric(existingNum, partitionTokens, factory, attributeType);
      }
    }
  }
  
  public void adaptExistingEvent(ArrayList<String> partition, XFactoryNaiveImpl factory, Activity activity) {
    for (String subPartition : partition) {
      if (subPartition.contains(" is ")) {
        String[] partitionTokens = subPartition.split(" is ");
        xEvent.getAttributes().put(partitionTokens[0], factory.createAttributeLiteral(partitionTokens[0], partitionTokens[1], null));
      } else {
        String[] tokens = subPartition.split(" ");
        String attributeType = activity.getAttribute(tokens[2]).getType();
        XAttribute attribute = xEvent.getAttributes().get(tokens[2]);
        if (attribute == null) {
          XAttribute newAttribute = getRandomAttrValue(tokens, attributeType, factory);
          xEvent.getAttributes().put(tokens[2], newAttribute);
        } else {
          adaptNumeric(attribute.toString(), tokens, factory, attributeType);
        }
      }
    }
  }
  
  private XAttribute getRandomAttrValue(String[] rangeTokens, String type, XFactoryNaiveImpl factory) {
    if (type.equals("integer")) {
      int random = getRandomInteger(Integer.parseInt(rangeTokens[0].split("\\.")[0]),
      Integer.parseInt(rangeTokens[4].split("\\.")[0]));
      return factory.createAttributeDiscrete(rangeTokens[2], random, null);
    } else {
      double random = getRandomDouble(Double.parseDouble(rangeTokens[0]), Double.parseDouble(rangeTokens[4]));
      return factory.createAttributeContinuous(rangeTokens[2], random, null);
    }
  }
  
  private XAttributeMap copyAttributeMap(XAttributeMap oldAttributes, XFactoryNaiveImpl factory) {
    XAttributeMap newAttributes = factory.createAttributeMap();
    newAttributes.putAll(oldAttributes);
    return newAttributes;
  }
  
  private void adaptNumeric(String number, String[] partitionTokens, XFactoryNaiveImpl factory, String type) {
    if (Double.parseDouble(number) <= Double.parseDouble(partitionTokens[0])) {
      adaptToBound(partitionTokens[2], partitionTokens[0], partitionTokens[4], partitionTokens[1], factory, type);
    } else if (Double.parseDouble(number) >= Double.parseDouble(partitionTokens[4])) {
      adaptToBound(partitionTokens[2], partitionTokens[4], partitionTokens[0], partitionTokens[3], factory, type);
    } else {
      XAttribute attribute = type.equals("integer")?
      factory.createAttributeDiscrete(partitionTokens[2], Integer.parseInt(number.split("\\.")[0]), null) :
      factory.createAttributeContinuous(partitionTokens[2], Double.parseDouble(number), null);
      xEvent.getAttributes().put(partitionTokens[2], attribute);
    }
  }
  
  private void adaptToBound(String attributeName, String start, String end, String operator, XFactoryNaiveImpl factory, String type) {
    if (operator.equals("<=")) {
      XAttribute attribute = type.equals("integer")?
      factory.createAttributeDiscrete(attributeName, Integer.parseInt(start.split("\\.")[0]), null) :
      factory.createAttributeContinuous(attributeName, Double.parseDouble(start), null);
      xEvent.getAttributes().put(attributeName, attribute);
    } else {
      if (type.equals("integer")) {
        int startInt = Integer.parseInt(start.split("\\.")[0]);
        int endInt = Integer.parseInt(end.split("\\.")[0]);
        int nextValue = startInt < endInt? startInt + 1 : startInt - 1;
        xEvent.getAttributes().put(attributeName, factory.createAttributeDiscrete(attributeName, nextValue, null));
      } else {
        double nextValue = Math.nextAfter(Double.parseDouble(start), Double.parseDouble(end));
        xEvent.getAttributes().put(attributeName, factory.createAttributeContinuous(attributeName, nextValue, null));
      }
    }
  }
  
  private double getRandomDouble(double min, double max) {
    double random = new Random().nextDouble();
    double result = min + (random * (max - min));
    return BigDecimal.valueOf(result).setScale(getDecimalPlaces(min, max), RoundingMode.HALF_UP).doubleValue();
  }
  
  private int getDecimalPlaces(double min, double max) {
    int minLength = String.valueOf(min).split("\\.")[1].length();
    int maxLength = String.valueOf(max).split("\\.")[1].length();
    return Math.max(minLength, maxLength);
  }
  
  private int getRandomInteger(int min, int max) {
    return (int) ((Math.random() * (max - min)) + min);
  }
  
  
  
  @Override
  public String toString() {
    return "\t\t" + XConceptExtension.instance().extractName(xEvent) + " " + xEvent.getAttributes() + " in state " + state + ",\n";
  }
  
  public XEvent getxEvent() {
    return xEvent;
  }
  
  public String getState() {
    return state;
  }
  
  public XAttributeMap getAttributes() {
    return xEvent.getAttributes();
  }
}