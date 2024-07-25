package model;

import java.util.ArrayList;
import java.util.Arrays;

public class Attribute {

    private final String name;
    private String type;
    private double minValue, maxValue;
    private String[] values;
    private final ArrayList<Condition> conditions;
    private ArrayList<Condition> disjointConditions;

    public Attribute(String name) {
        this.name = name;
        this.conditions = new ArrayList<>();
    }







    //Section: Evaluation and set up the attribute
    public void setEnumAttribute(String[] values) {
        this.type = "enum";
        this.values = values;
        conditions.add(new Condition(type,name + " in " + String.join(", ", values)));
    }

    public void setNumericAttribute(double min, double max) {
        this.type = "numeric";
        this.minValue = min;
        this.maxValue = max;
        conditions.add(new Condition(type,name + " >= " + minValue));
        conditions.add(new Condition(type,name + " <= " + maxValue));
    }


    //Section: Condition addition and consequent validation
    public void addCondition(Condition condition) {
        if (!conditions.contains(condition)) {
            conditions.add(condition);
        }
    }

    public String isConditionValid(Condition condition) {
        String result = type.equals("enum")? isEnumConditionValid(condition) : isNumericConditionValid(condition);
        return (result.equals("true") || result.equals("false"))? result : name + " " + result;
    }


    //Section: Enum condition validation
    private String isEnumConditionValid(Condition condition) {
        ArrayList<String> conditionStrings = condition.getValues();
        return condition.isIncluded()? enumContainedValid(conditionStrings) : enumNotContainedValid(conditionStrings);
    }

    private String enumContainedValid(ArrayList<String> conditionStrings) {
        ArrayList<String> valid = new ArrayList<>();
        for (String conditionString : conditionStrings) {
            if (Arrays.asList(values).contains(conditionString)) {
                valid.add(conditionString);
            }
        }
        String result = evaluateValidList(conditionStrings, valid);
        if (result.equals("true") || result.equals("false")) {
            return result;
        } else {
            return valid.size() > 1? "is in " + result : "is " + result;
        }
    }

    private String evaluateValidList(ArrayList<String> conditionStrings, ArrayList<String> valid) {
        if (valid.isEmpty()) {
            return "false";
        } else if (valid.size() == conditionStrings.size()) {
            return "true";
        } else {
            return String.join(", ", valid);
        }
    }

    private String enumNotContainedValid(ArrayList<String> conditionStrings) {
        ArrayList<String> notValid = new ArrayList<>(conditionStrings);
        for (String value : values) {
            if (conditionStrings.contains(value) && !notValid.contains(value)) {
                notValid.add(value);
            }
        }
        return notValid.size() == values.length? "false" : "true";
    }


    //Section: Numeric condition validation
    private String isNumericConditionValid(Condition condition) {
        if (isValueValid(condition.getStart()) || isValueValid(condition.getEnd())) {
            return "true";
        } else if (condition.getStart() < maxValue && condition.getEnd() == Double.POSITIVE_INFINITY) {
            return ">= " + minValue;
        } else if (condition.getEnd() > minValue && condition.getStart() == Double.NEGATIVE_INFINITY) {
            return "<= " + maxValue;
        } else if (condition.getStart() == minValue || condition.getEnd() == minValue) {
            return evaluateLowerBoundValid(condition);
        } else if (condition.getStart() == maxValue || condition.getEnd() == maxValue) {
            return evaluateUpperBoundValid(condition);
        } else {
            return "false";
        }
    }

    private boolean isValueValid(double value) {
        return (minValue < value && value < maxValue);
    }

    private String evaluateLowerBoundValid(Condition condition) {
        if (condition.getEnd() == Double.POSITIVE_INFINITY || condition.getStart() == condition.getEnd()) {
            return "true";
        } else {
            return condition.isClosedRight()? "true" : "false";
        }
    }

    private String evaluateUpperBoundValid(Condition condition) {
        if (condition.getStart() == Double.NEGATIVE_INFINITY || condition.getStart() == condition.getEnd()) {
            return "true";
        } else {
            return condition.isClosedLeft()? "true" : "false";
        }
    }


    //Section: Decomposition of attribute
    public ArrayList<String> decomposeAttribute() {
        if (disjointConditions != null) {
            return disjointConditionsToStrings();
        } else {
            return type.equals("enum")? decomposeEnumAttribute() : decomposeNumericAttribute();
        }
    }

    private ArrayList<String> decomposeNumericAttribute() {
        disjointConditions = new ArrayList<>();
        System.out.println(conditions);
        for (Condition condition : conditions) {
          //  System.out.println(disjointConditions + " adding " + condition);
            addToDisjoint(condition);
        }
       // System.out.println(disjointConditions);
        return disjointConditionsToStrings();
    }

    private ArrayList<String> disjointConditionsToStrings() {
        ArrayList<String> disjointIntervalsStrings = new ArrayList<>();
        for (Condition condition : disjointConditions) {
            if (condition.getStart() != Double.NEGATIVE_INFINITY && condition.getEnd() != Double.POSITIVE_INFINITY) {
                disjointIntervalsStrings.add(condition.getRangeString(name));
            }
        }
        return disjointIntervalsStrings;
    }

    private ArrayList<String> decomposeEnumAttribute() {
        ArrayList<String> formatted = new ArrayList<>();
        for (String value : values) {
            formatted.add(name + " is " + value);
        }
        return formatted;
    }


    //TODO: This method is hideous, move some stuff in Condition? Test for = and != both present
    //Section: Creation of numeric disjoint intervals
    private void addToDisjoint(Condition condition) {
        if (disjointConditions.isEmpty()) {
            evaluateFirstInterval(condition);
        } else {
            if (condition.getEnd() == Double.POSITIVE_INFINITY) {
                int pos = disjointConditions.size() - 1;
                while (disjointConditions.get(pos - 1).getStart() > condition.getStart()) {
                    pos--;
                }
                addGreaterInterval(condition, pos);
            } else {
                int pos = 0;
                while (disjointConditions.get(pos + 1).getEnd() < condition.getEnd()) {
                    pos++;
                }
                if (condition.getStart() == Double.NEGATIVE_INFINITY) {
                    addLessInterval(condition, pos);
                } else {
                    addEqualInterval(condition, pos);
                }
            }
        }
    }

    private void evaluateFirstInterval(Condition condition) {
        String[][] array = new String[][]{{" <= "," > "}, {" < ", " >= "}, {" < ", " >= "}, {" <= ", " > "},
                {" < ", " = ", " > "}};
        if (condition.getStart() == Double.NEGATIVE_INFINITY && condition.isClosedRight()) {
            addFirstIntervals(array[0], condition.getEnd());
        } else if (condition.getStart() == Double.NEGATIVE_INFINITY && !condition.isClosedRight()) {
            addFirstIntervals(array[1], condition.getEnd());
        } else if (condition.getEnd() == Double.POSITIVE_INFINITY && condition.isClosedLeft()) {
            addFirstIntervals(array[2], condition.getStart());
        } else if (condition.getEnd() == Double.POSITIVE_INFINITY && !condition.isClosedLeft()) {
            addFirstIntervals(array[3], condition.getStart());
        } else {
            addFirstIntervals(array[4], condition.getStart());
        }
    }

    private void addFirstIntervals(String[] strings, double number) {
        for (String string : strings) {
            disjointConditions.add(new Condition(type, name + string + number));
        }
    }

    private void addLessInterval(Condition condition, int pos) {
        Condition newCondition = new Condition(type, condition.getString());
        Condition intervalBefore = disjointConditions.get(pos);
        Condition intervalAfter = disjointConditions.get(pos + 1);
        if (intervalBefore.getEnd() < newCondition.getEnd()) {
            newCondition.setStart(intervalBefore.getEnd());
            newCondition.setClosedLeft(!intervalBefore.isClosedRight());
            if (intervalAfter.getStart() < newCondition.getEnd()) {
                intervalAfter.setStart(newCondition.getEnd());
                intervalAfter.setClosedLeft(!newCondition.isClosedRight());
            }
            disjointConditions.add(++pos, newCondition);
        } else {
            intervalBefore.setStart(newCondition.getEnd());
            intervalBefore.setClosedLeft(!newCondition.isClosedRight());
            disjointConditions.add(0, newCondition);
        }
    }

    private void addGreaterInterval(Condition condition, int pos) {
        Condition newCondition = new Condition(type, condition.getString());
        Condition intervalBefore = disjointConditions.get(pos - 1);
        Condition intervalAfter = disjointConditions.get(pos);
        if (intervalAfter.getStart() > newCondition.getStart()) {
            newCondition.setEnd(intervalAfter.getStart());
            newCondition.setClosedRight(!intervalAfter.isClosedLeft());
            if (intervalBefore.getEnd() > newCondition.getStart()) {
                intervalBefore.setEnd(newCondition.getStart());
                intervalBefore.setClosedRight(!newCondition.isClosedLeft());
            }
            disjointConditions.add(pos, newCondition);
        } else {
            intervalAfter.setEnd(newCondition.getStart());
            intervalAfter.setClosedRight(!newCondition.isClosedLeft());
            disjointConditions.add(disjointConditions.size(), newCondition);
        }
    }

    private void addEqualInterval(Condition condition, int pos) {
        if (disjointConditions.get(pos).getEnd() == condition.getStart()) {
            addToDisjoint(new Condition(type,name + " > " + condition.getEnd()));
        } else {
            addToDisjoint(new Condition(type,name + " < " + condition.getStart()));
            addToDisjoint(new Condition(type,name + " > " + condition.getEnd()));
        }
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
            stringBuilder.append("The followings are my intervals: ").append(disjointConditions).append("\n");
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