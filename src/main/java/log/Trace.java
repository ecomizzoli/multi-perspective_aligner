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
  public ArrayList<Event> getTrace() {
    return this.originalEventsList;
  }
  
  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("\tTrace " + name + " contains " + originalEventsList.size() + " events:\n");
    for (Event event : originalEventsList) {
      builder.append(event);
    }
    builder.append(this.getTrace()).append("\n");
    // builder.append("\tTrace ").append(name).append(" after alignment contains ").append(alignedEventsList.size()).append(" events:\n");
    // for (Event event : alignedEventsList) {
    //   builder.append(event);
    // }
    // builder.append(getSequence("repaired")).append("\n");
    return builder.toString();
  }
  
  public XTrace buildOriginalXTrace() {
    XFactoryNaiveImpl factory = new XFactoryNaiveImpl();
    XTrace originalXTrace = factory.createTrace();
    for (Event event : originalEventsList) {
      originalXTrace.add(event.getxEvent());
    }
    return originalXTrace;
  }
}