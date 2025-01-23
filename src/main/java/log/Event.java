package log;

import model.Activity;
import model.Attribute;

import org.deckfour.xes.extension.std.XConceptExtension;
import org.deckfour.xes.extension.std.XLifecycleExtension;
import org.deckfour.xes.extension.std.XTimeExtension;
import org.deckfour.xes.model.XAttribute;
import org.deckfour.xes.model.XEvent;

import java.util.*;

public class Event {
  
  // TODO Fix this up. Remove partioning logic

  private XEvent xEvent;
  private String state;
  private String name;
  private Map<Attribute, String> attributeAssignments;
  
  public Event(XEvent event, Activity modelActivity) {
    this.xEvent = event;
    // this.state = defineState(modelActivity);
    this.state = modelActivity.getName();

    this.attributeAssignments = this.buildAttributeAssignments(event);
  }

  private Map<Attribute, String> buildAttributeAssignments(XEvent event) {
    HashMap<Attribute, String> map = new HashMap<>();

    Iterator<Map.Entry<String, XAttribute>> it = event.getAttributes().entrySet().iterator();
    Map.Entry<String, XAttribute> cur;
    while (it.hasNext()) {
      cur = it.next();
      String attKey = cur.getKey();
      if (attKey.equals(XConceptExtension.KEY_NAME) || attKey.equals(XLifecycleExtension.KEY_TRANSITION) || attKey.equals(XTimeExtension.KEY_TIMESTAMP))
        continue;

      map.put(new Attribute(cur.getKey()), cur.getValue().toString());
    }
    return map;
  }
  public XEvent getXEvent() {
    return this.xEvent;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getName() {
    return this.name;
  }
  public Map<Attribute, String> getAttributeAssignments() {
    return this.attributeAssignments;
  }

  
  @Override
  public String toString() {
    return "\t\t" + XConceptExtension.instance().extractName(xEvent) + " " + xEvent.getAttributes() + " in state " + state + ",\n";
  }
}