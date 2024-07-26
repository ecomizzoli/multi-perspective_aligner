package model;

import org.apache.commons.collections15.map.CaseInsensitiveMap;

import java.util.*;

public class DeclareModel {

    private final HashMap<String, Activity> activities;
    private final ArrayList<DeclareConstraint> declareConstraints;

    public DeclareModel(Map<String, ArrayList<String[]>> parsedLines) {
        this.activities = addActivities(parsedLines.get("activityLines"));
        Map<String, Attribute> attributes = bindAttributes(parsedLines.get("bindingLines"));
        initializeAttributes(parsedLines.get("intAttributeLines"), parsedLines.get("floatAttributeLines"), parsedLines.get("enumAttributeLines"), attributes);
        this.declareConstraints = addConstraints(parsedLines.get("binaryConstraintLines"), parsedLines.get("unaryConstraintLines"));
        createPartitions();
    }


    //Section: Evaluation of each Activity and their Attribute bindings
    private HashMap<String, Activity> addActivities(ArrayList<String[]> activityLines) {
        HashMap<String, Activity> newActivities = new HashMap<>();
        for (String[] line : activityLines) {
            newActivities.put(line[0], new Activity(line[0]));
        }
        return newActivities;
    }

    private Map<String, Attribute> bindAttributes(ArrayList<String[]> bindingLines) {
        Map<String, Attribute> overAllAttributes = new HashMap<>();
        for (String[] line : bindingLines) {
            for (String activityName : extractList(line[0])) {
                Activity involvedActivity = activities.get(activityName);
                if (involvedActivity != null) {
                    bindAttributesToActivity(involvedActivity, extractList(line[1]), overAllAttributes);
                } else {
                    System.out.println("Activity " + activityName + " not found");
                }
            }
        }
        return overAllAttributes;
    }

    private void bindAttributesToActivity(Activity activity, String[] attributeNames, Map<String, Attribute> attributes) {
        for (String name : attributeNames) {
            Attribute existentAttribute = attributes.get(name);
            if (existentAttribute != null) {
                activity.addAttribute(existentAttribute);
            } else {
                Attribute newAttribute = new Attribute(name);
                activity.addAttribute(newAttribute);
                attributes.put(name, newAttribute);
            }
        }
    }


    //Section: Initialization of each attribute and finally removing missing initializations
    private void initializeAttributes(ArrayList<String[]> integers, ArrayList<String[]> floats, ArrayList<String[]> enums, Map<String, Attribute> attributes) {
        initializeNumericAttributes("integer", integers, attributes);
        initializeNumericAttributes("float", floats, attributes);
        initializeEnumAttributes(enums, attributes);
        removeNotInitAttributes();
    }

    private void initializeNumericAttributes(String type, ArrayList<String[]> attributeLines, Map<String, Attribute> attributesMap) {
        for (String[] line : attributeLines) {
            for (String attributeName : extractList(line[0])) {
                Attribute attribute = attributesMap.get(attributeName);
                if (attribute != null && attribute.getType() == null) {
                    attribute.setNumericAttribute(type, Double.parseDouble(line[1]), Double.parseDouble(line[2]));
                }
            }
        }
    }

    private void initializeEnumAttributes(ArrayList<String[]> attributeLines, Map<String, Attribute> attributesMap) {
        for (String[] line : attributeLines) {
            for (String attributeName : extractList(line[0])) {
                Attribute attribute = attributesMap.get(attributeName);
                if (attribute != null && attribute.getType() == null) {
                    attribute.setEnumAttribute(extractList(line[1]));
                } else {
                    System.out.println("Attribute " + attributeName + " not found");
                }
            }
        }
    }

    private String[] extractList(String subString) {
        return subString.replaceAll(" ", "").split(",");
    }

    private void removeNotInitAttributes() {
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            activity.getValue().getAttributes().removeIf(attribute -> attribute.getType() == null);
        }
    }


    //Section: Evaluation of each Constraint
    private ArrayList<DeclareConstraint> addConstraints(ArrayList<String[]> binaryConstraints, ArrayList<String[]> unaryConstraints) {
        ArrayList<DeclareConstraint> newConstraints = new ArrayList<>();
        addUnaryConstraint(newConstraints, unaryConstraints);
        addBinaryConstraint(newConstraints, binaryConstraints);
        return newConstraints;
    }

    private void addUnaryConstraint(ArrayList<DeclareConstraint> constraints, ArrayList<String[]> unaryConstraints) {
        for (String[] line : unaryConstraints) {
            DeclareConstraint constraint = constructUnaryConstraint(line);
            if (constraint != null && constraint.assignConditionsToAttributes(activities)) {
                constraints.add(constraint);
            }
        }
    }

    private void addBinaryConstraint(ArrayList<DeclareConstraint> constraints, ArrayList<String[]> binaryConstraints) {
        for (String[] line : binaryConstraints) {
            DeclareConstraint constraint = constructBinaryConstraint(line);
            if (constraint != null && constraint.assignConditionsToAttributes(activities)) {
                constraints.add(constraint);
            }
        }
    }

    private DeclareConstraint constructUnaryConstraint(String[] constraintTokens) {
        DeclareTemplate template = DeclareTemplate.getByTemplateName(constraintTokens[0]);
        String activity = constraintTokens[1];
        if (template != null && activities.get(activity) != null) {
            String activationCondition = constraintTokens[2] == null? null : constraintTokens[2];
            return new DeclareConstraint(template, activity, activationCondition, null,null);
        }
        return null;
    }

    private DeclareConstraint constructBinaryConstraint(String[] constraintTokens) {
        DeclareTemplate template = DeclareTemplate.getByTemplateName(constraintTokens[0]);
        String activationActivity, targetActivity;

        if (template != null) {
            if (template.getReverseActivationTarget()) {
                targetActivity = constraintTokens[1];
                activationActivity = constraintTokens[2];
            } else {
                activationActivity = constraintTokens[1];
                targetActivity = constraintTokens[2];
            }

            if (activities.get(targetActivity) != null && activities.get(activationActivity) != null) {
                String activationCondition = constraintTokens[3].isBlank()? null : constraintTokens[3];
                String targetCondition = constraintTokens[4].isBlank()? null : constraintTokens[4];
                return new DeclareConstraint(template, activationActivity, activationCondition, targetActivity, targetCondition);
            }
        }
        return null;
    }


    //Section: Partitioning and cost addition
    private void createPartitions() {
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            activity.getValue().decomposeAttributes();
        }
    }

    public void assignCosts(Map<String, int[]> costs) {
        for (Map.Entry<String, int[]> cost : costs.entrySet()) {
            Activity activity = activities.get(cost.getKey());
            if (activity != null) {
                activity.assignActionCosts(cost.getValue());
            }
        }
    }

    public HashMap<String, ArrayList<String>> getEquivalenceClasses() {
        HashMap<String, ArrayList<String>> equivalenceClasses = new HashMap<>();
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            ArrayList<String> activityEquivalences = new ArrayList<>();
            for (Map.Entry<String, ArrayList<String>> partition : activity.getValue().getPartitions().entrySet()) {
                ArrayList<String> equivalenceLine = new ArrayList<>();
                for (Map.Entry<String, ArrayList<String>> partition2 : activity.getValue().getPartitions().entrySet()) {
                    if (!partition.getKey().equals(partition2.getKey())) {
                        equivalenceLine.add(partition2.getKey());
                    }
                }
                equivalenceClasses.put(partition.getKey(), equivalenceLine);
                activityEquivalences.add(partition.getKey());
            }
            if (activity.getValue().getAttributes().isEmpty()) {
                equivalenceClasses.put(activity.getKey(), activityEquivalences);
            } else {
                equivalenceClasses.put(activity.getKey() + "p0", activityEquivalences);
            }
        }
        return equivalenceClasses;
    }


    //Section: Utils
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder("This model contains " + activities.size() + " activities:\n\n");
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
            builder.append(activity).append("\n");
        }
        builder.append("This model contains following constraints:\n");
        for (DeclareConstraint constraint : declareConstraints) {
            builder.append(constraint).append("\n");
        }
        return builder.toString();
    }

    public HashMap<String, Activity> getActivities() {
        return activities;
    }

    public ArrayList<DeclareConstraint> getDeclareConstraints()  {
        return declareConstraints;
    }
}