package log;

import model.Activity;
import model.DeclareModel;
import org.deckfour.xes.model.XLog;
import org.deckfour.xes.model.XTrace;
import translations.PDDLGenerator;

import java.util.ArrayList;
import java.util.Map;

public class LogFile {
  
  private final ArrayList<Trace> traces;
  
  public LogFile(XLog xLog, DeclareModel declareModel) {
    this.traces = findTraces(xLog, declareModel.getActivities());
  }
  
  public ArrayList<Trace> findTraces(XLog xlog, Map<String, Activity> activityMap) {
    ArrayList<Trace> newTraces = new ArrayList<>();
    if (xlog != null) {
      for (XTrace trace : xlog) {
        newTraces.add(new Trace(trace, activityMap));
      }
    }
    return newTraces;
  }
  
  public ArrayList<String> defineProblems(PDDLGenerator pddlGenerator) {
    ArrayList<String> problems = new ArrayList<>();
    for (Trace trace : traces) {
      problems.add(pddlGenerator.generateProblem(trace.getSequence("original")));
    }
    return problems;
  }
  
  public void repairTraces(ArrayList<String> alignments, Map<String, Activity> activityMap) {
    for (int i = 0; i < traces.size(); i++) {
      traces.get(i).repairTrace(alignments.get(i), activityMap);
    }
  }
  
  public ArrayList<XTrace> buildOriginalXTraces() {
    ArrayList<XTrace> originalXTraces = new ArrayList<>();
    for (Trace trace : traces) {
      trace.buildOriginalXTrace();
    }
    return originalXTraces;
  }
  
  public ArrayList<XTrace> buildRepairedXTraces() {
    ArrayList<XTrace> originalXTraces = new ArrayList<>();
    for (Trace trace : traces) {
      trace.buildRepairedXTrace();
    }
    return originalXTraces;
  }
  
  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder("This log contains " + traces.size() + " traces:\n");
    for (Trace trace : traces) {
      builder.append(trace.toString()).append("\n");
    }
    return builder.toString();
  }
}