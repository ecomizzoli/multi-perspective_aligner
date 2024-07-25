package log;

import model.Activity;
import org.deckfour.xes.extension.std.XConceptExtension;
import org.deckfour.xes.factory.XFactoryNaiveImpl;
import org.deckfour.xes.model.XAttributeMap;
import org.deckfour.xes.model.XEvent;
import org.deckfour.xes.model.XTrace;
import java.util.*;

public class Trace {

    private final ArrayList<Event> originalEventsList;
    private ArrayList<Event> alignedEventsList;
    private final String name;

    public Trace(XTrace trace, Map<String, Activity> activityMap) {
        this.name = XConceptExtension.instance().extractName(trace);
        this.originalEventsList = readTrace(trace, activityMap);
    }

    private ArrayList<Event> readTrace(XTrace trace, Map<String, Activity> activityMap) {
        ArrayList<Event> newEvents = new ArrayList<>();
        for (XEvent event : trace) {
            Activity relatedActivity = activityMap.get(XConceptExtension.instance().extractName(event));
            if (relatedActivity != null) {
                newEvents.add(new Event(event, relatedActivity));
            } else {
                System.out.println("Activity " + XConceptExtension.instance().extractName(event) + " not found");
            }
        }
        return newEvents;
    }

    public ArrayList<String> getSequence(String sequenceType) {
        ArrayList<String> sequence = new ArrayList<>();
        ArrayList<Event> eventList = sequenceType.equals("original") ? originalEventsList : alignedEventsList;
        for (Event event : eventList) {
            sequence.add(event.getState());
        }
        return sequence;
    }


    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder("\tTrace " + name + " contains " + originalEventsList.size() + " events:\n");
        for (Event event : originalEventsList) {
            builder.append(event);
        }
        builder.append(getSequence("original")).append("\n");
        builder.append("\tTrace ").append(name).append(" after alignment contains ").append(alignedEventsList.size()).append(" events:\n");
        for (Event event : alignedEventsList) {
            builder.append(event);
        }
        builder.append(getSequence("repaired")).append("\n");
        return builder.toString();
    }


    public void repairTrace2(String alignment, Map<String, Activity> activityMap) {
        alignedEventsList = new ArrayList<>();
        System.out.println(alignment + "\n");
        String[] lines = alignment.split("\\R");
        for (int originalTraceIndex = 0, repairedTraceIndex = 0, alignmentIndex = 0; alignmentIndex < lines.length; alignmentIndex++) {
            String nextLine = lines[alignmentIndex];
            if (nextLine.contains("sync")) {
                alignedEventsList.add(originalEventsList.get(originalTraceIndex));
                originalTraceIndex++;
                repairedTraceIndex++;
            } else if (nextLine.contains("del_")) {
                originalTraceIndex++;
            } else if (nextLine.contains("add_")) {
                String eventPartition = nextLine.split("add_")[1].split(" ")[2];
                addEvent2(eventPartition, repairedTraceIndex, activityMap);
                repairedTraceIndex++;
            } else if (nextLine.contains("repl_")) {
                String newPartition = nextLine.split("repl_")[1].split(" ")[3];
                replaceEvent2(newPartition, originalTraceIndex, repairedTraceIndex, activityMap);
                originalTraceIndex++;
                repairedTraceIndex++;
            }

        }
    }

    private void addEvent2(String eventPartition, int index, Map<String, Activity> activities) {
        Activity activity = activities.get(eventPartition.split("_")[0]);
        ArrayList<String> activityPartition = activity.getPartitions().get(eventPartition);
        XAttributeMap attributesOccurrenceBefore = eventOccurredBefore2(activity.getName(), index - 1);
        if (attributesOccurrenceBefore != null) {
            alignedEventsList.add(index, new Event(eventPartition, activityPartition, attributesOccurrenceBefore));
        } else {
            alignedEventsList.add(index, new Event(eventPartition, activityPartition));
        }
    }

    private void replaceEvent2(String newPartition, int originalIndex, int repairedIndex, Map<String, Activity> activities) {
        Activity activity = activities.get(newPartition.split("_")[0]);
        ArrayList<String> activityPartition = activity.getPartitions().get(newPartition);
        Event event = originalEventsList.get(originalIndex);
        alignedEventsList.add(repairedIndex, new Event(event, newPartition, activityPartition));
    }

    private XAttributeMap eventOccurredBefore2(String activityName, int pos) {
        for (int i = pos; i >= 0; i--) {
            if (alignedEventsList.get(i).getState().split("_")[0].equals(activityName)) {
                return alignedEventsList.get(i).getAttributes();
            }
        }
        return null;
    }

    public XTrace buildOriginalXTrace() {
        XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
        XTrace originalXTrace = factory.createTrace();
        for (Event event : originalEventsList) {
            originalXTrace.add(event.getxEvent());
        }
        return originalXTrace;
    }

    public XTrace buildRepairedXTrace() {
        XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
        XTrace repairedXTrace = factory.createTrace();
        for (Event event : alignedEventsList) {
            repairedXTrace.add(event.getxEvent());
        }
        return repairedXTrace;
    }
}