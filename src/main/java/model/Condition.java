package model;

import java.util.ArrayList;
import java.util.Arrays;

public class Condition {

    private final String string, type;
    private double start, end;
    private boolean closedLeft, closedRight, included;
    private ArrayList<String> values;
    private final double NEG_INF = Double.NEGATIVE_INFINITY;
    private final double POS_INF = Double.POSITIVE_INFINITY;

    public Condition(String attributeType, String conditionString) {
        this.string = conditionString.trim();
        this.type = attributeType;
        evaluateCondition();
    }


    //Section: evaluation and set up of condition
    private void evaluateCondition() {
        if (type.equals("enum")) {
            evaluateEnumCondition();
        } else {
            evaluateNumericCondition();
        }
    }

    private void evaluateNumericCondition() {
        String expr = string.replace(" ", "");
        double number = Double.parseDouble(expr.split("<=|>=|!=|=|<|>")[1]);

        if (string.contains("<=")) {
            initializeInterval(false, NEG_INF, number,true);
        } else if (string.contains(">=")) {
            initializeInterval(true, number, POS_INF, false);
        } else if (string.contains("=")) {
            initializeInterval(true, number, number,true);
        } else if (string.contains("<")) {
            initializeInterval(false, NEG_INF, number, false);
        } else {
            initializeInterval(false, number, POS_INF, false);
        }
    }

    private void initializeInterval(boolean closedLeft, double start, double end, boolean closedRight) {
        this.closedLeft = closedLeft;
        this.start = start;
        this.end = end;
        this.closedRight = closedRight;
    }

    private void evaluateEnumCondition() {
        String valuesString = string.split(" is not | not in | is | in ")[1];
        String[] values = valuesString.replace(" ", "").split(",");
        initializeAcceptedValues(values, !string.contains(" not "));
    }

    private void initializeAcceptedValues(String[] values, boolean included) {
        this.values = new ArrayList<>(Arrays.asList(values));
        this.included = included;
    }


    //Section: Check if partition is accepted
    public boolean isNumericContained(String[] partitionTokens) {
        double partitionStart = Double.parseDouble(partitionTokens[0]);
        double partitionEnd = Double.parseDouble(partitionTokens[4]);
        if (start == NEG_INF) {
            return (isClosedRight() || partitionTokens[3].equals("<"))? partitionEnd <= end : partitionEnd < end;
        } else if (end == POS_INF) {
            return (isClosedLeft() || partitionTokens[1].equals("<"))? start <= partitionStart : start < partitionStart;
        } else {
            return start <= partitionStart && partitionEnd <= end;
        }
    }

    public boolean isEnumContained(String value) {
        return (included && values.contains(value)) || (!included && !values.contains(value));
    }


    @Override
    public boolean equals(Object o) {
        if (o instanceof Condition condition) {
            return string.equals(condition.getString());
        }
        return false;
    }

    @Override
    public String toString() {
        return type.equals("enum")? enumToString() : numericToString();
    }

    private String enumToString() {
        String contains = included? "contains " : "contains not ";
        return contains + String.join(", ", values);
    }

    private String numericToString() {
        String leftBracket = closedLeft? "[" : "(";
        String rightBracket = closedRight? "]" : ")";
        return leftBracket + start + ", " + end + rightBracket;
    }

    public String getRangeString(String attributeName) {
        StringBuilder builder = new StringBuilder();
        String operatorLeft = isClosedLeft()? "<=" : "<";
        String operatorRight = isClosedRight()? "<=" : "<";
        builder.append(getStart()).append(" ").append(operatorLeft).append(" ").append(attributeName)
                .append(" ").append(operatorRight).append(" ").append(getEnd());
        return builder.toString();
    }

    public String getString() {
        if (string.contains(" in ")) {
            String[] listStringTokens = string.split(" in ");
            return listStringTokens[0] + " in (" + listStringTokens[1] + ")";
        } else {
            return string;
        }
    }

    public ArrayList<String> getValues() {
        return values;
    }


    public double getStart() {
        return start;
    }

    public void setStart(double start) {
        this.start = start;
    }

    public double getEnd() {
        return end;
    }

    public void setEnd(double end) {
        this.end = end;
    }

    public boolean isClosedLeft() {
        return closedLeft;
    }

    public void setClosedLeft(boolean closedLeft) {
        this.closedLeft = closedLeft;
    }

    public boolean isClosedRight() {
        return closedRight;
    }

    public void setClosedRight(boolean closedRight) {
        this.closedRight = closedRight;
    }

    public String getType() {
        return type;
    }

    public boolean isIncluded() {
        return included;
    }
}