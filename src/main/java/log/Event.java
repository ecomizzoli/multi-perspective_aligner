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

    public Event(String state, ArrayList<String> partition) {
        this.state = state;
        XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
        this.xEvent = factory.createEvent();
        XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
        initializeNewEvent(partition, factory);
    }

    public Event(String state, ArrayList<String> partition, XAttributeMap oldAttributes) {
        this.state = state;
        XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
        this.xEvent = factory.createEvent(copyAttributeMap(oldAttributes, factory));
        XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
        initializeNewRelatedEvent(partition, factory);
    }

    public Event(Event oldEvent, String partitionName, ArrayList<String> partition) {
        this.state = partitionName;
        XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
        XEvent oldXEvent = oldEvent.getxEvent();
        this.xEvent = factory.createEvent(copyAttributeMap(oldXEvent.getAttributes(), factory));
        XConceptExtension.instance().assignName(this.xEvent, state.split("_")[0]);
        adaptExistingEvent(partition, factory);
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
                } else if (type.equals("numeric") && part.contains(eventAttribute.getKey())) {
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

    private void initializeNewEvent(ArrayList<String> partition, XFactoryNaiveImpl factory) {
        for (String string : partition) {
            if (string.contains(" is ")) {
                String[] tokens = string.split(" is ");
                xEvent.getAttributes().put(tokens[0], factory.createAttributeLiteral(tokens[0], tokens[1], null));
            } else {
                String[] tokens = string.split(" ");
                double random = getRandomValue(Double.parseDouble(tokens[0]), Double.parseDouble(tokens[4]));
                xEvent.getAttributes().put(tokens[2], factory.createAttributeLiteral(tokens[2], String.valueOf(random), null));
            }
        }
    }

    private void initializeNewRelatedEvent(ArrayList<String> partition, XFactoryNaiveImpl factory) {
        for (String subPartition : partition) {
            if (subPartition.contains(" is ")) {
                String[] partitionTokens = subPartition.split(" is ");
                xEvent.getAttributes().put(partitionTokens[0], factory.createAttributeLiteral(partitionTokens[0], partitionTokens[1], null));
            } else {
                String[] partitionTokens = subPartition.split(" ");
                String existingNum = xEvent.getAttributes().get(partitionTokens[2]).toString();
                adaptNumeric(existingNum, partitionTokens, factory);
            }
        }
    }

    public void adaptExistingEvent(ArrayList<String> partition, XFactoryNaiveImpl factory) {
        for (String subPartition : partition) {
            if (subPartition.contains(" is ")) {
                String[] partitionTokens = subPartition.split(" is ");
                xEvent.getAttributes().put(partitionTokens[0], factory.createAttributeLiteral(partitionTokens[0], partitionTokens[1], null));
            } else {
                String[] partitionTokens = subPartition.split(" ");
                String existingNum = xEvent.getAttributes().get(partitionTokens[2]).toString();
                if (existingNum == null) {
                    double random = getRandomValue(Double.parseDouble(partitionTokens[0]), Double.parseDouble(partitionTokens[4]));
                    xEvent.getAttributes().put(partitionTokens[2], factory.createAttributeLiteral(partitionTokens[2], String.valueOf(random), null));
                } else {
                    adaptNumeric(existingNum, partitionTokens, factory);
                }
            }
        }
    }

    private XAttributeMap copyAttributeMap(XAttributeMap oldAttributes, XFactoryNaiveImpl factory) {
        XAttributeMap newAttributes = factory.createAttributeMap();
        newAttributes.putAll(oldAttributes);
        return newAttributes;
    }

    private void adaptNumeric(String number, String[] partitionTokens, XFactoryNaiveImpl factory) {
        if (Double.parseDouble(number) < Double.parseDouble(partitionTokens[0])) {
            adaptToBound(partitionTokens[2], partitionTokens[0], partitionTokens[4], partitionTokens[1], factory);
        } else if (Double.parseDouble(number) > Double.parseDouble(partitionTokens[4])) {
            adaptToBound(partitionTokens[2], partitionTokens[4], partitionTokens[0], partitionTokens[1], factory);
        } else {
            xEvent.getAttributes().put(partitionTokens[2], factory.createAttributeLiteral(partitionTokens[2], number, null));
        }
    }

    private void adaptToBound(String attributeName, String start, String end, String operator, XFactoryNaiveImpl factory) {
        if (operator.equals("<=")) {
            xEvent.getAttributes().put(attributeName, factory.createAttributeLiteral(attributeName, start, null));
        } else {
            System.out.println(start + " " + end);
            double nextValue = Math.nextUp(Double.parseDouble(start));
            System.out.println(nextValue);
            xEvent.getAttributes().put(attributeName, factory.createAttributeLiteral(attributeName, String.valueOf(nextValue), null));
        }
    }

    private double getRandomValue(double min, double max) {
        double random = new Random().nextDouble();
        double result = min + (random * (max - min));
        return BigDecimal.valueOf(result).setScale(getDecimalPlaces(min, max), RoundingMode.HALF_UP).doubleValue();
    }

    private int getDecimalPlaces(double min, double max) {
        int minLength = String.valueOf(min).split("\\.")[1].length();
        int maxLength = String.valueOf(max).split("\\.")[1].length();
        return Math.max(minLength, maxLength);
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