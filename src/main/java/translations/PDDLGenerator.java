package translations;

import model.Activity;
import model.DeclareModel;
import org.processmining.ltl2automaton.plugins.LTL2Automaton;
import org.processmining.ltl2automaton.plugins.automaton.Automaton;
import org.processmining.ltl2automaton.plugins.automaton.State;
import org.processmining.ltl2automaton.plugins.automaton.Transition;
import org.processmining.ltl2automaton.plugins.formula.DefaultParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PDDLGenerator {

  private static final double CHANGE_VALUE_COST = 0.5;
  private static final double ADD_VALUE_COST = 1;
  private static final double SET_VALUE_COST = 0.5;
  private static final double DELETE_VALUE_COST = 1;
  private static final String DOMAIN_STRING = "(define (domain trace-alignment)\n" + //
        "\n" + //
        "  (:requirements :strips :typing :equality :adl :fluents :action-costs)\n" + //
        "\n" + //
        "  (:types activity automaton_state trace_state parameter_name value_name)\n" + //
        "\n" + //
        "  ; ; Constants for prob\n" + //
        "  ; (:constants\n" + //
        "  ;   t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - trace_state\n" + //
        "  ;   s10 s11 s20 s21 s30 s31 s40 s41 s50 s51 s60 s61 s62 s70 s71 s72 s73 s80 s81 s82 - automaton_state\n" + //
        "  ;   A B C D E F G - activity\n" + //
        "  ;   x y z - parameter_name\n" + //
        "  ;   a_x20 a_x40 a_y4 a_y6 a_z0 a_z1 c40 c30 c20 d10 d20 d40 e_x20 e_z0 e_z1 - value_name\n" + //
        "  ; )\n" + //
        "\n" + //
        "  ; ; Constants for prob2\n" + //
        "  ; (:constants\n" + //
        "  ;   t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - trace_state\n" + //
        "  ;   s10 s11 s20 s21 s30 s31 s40 s41 s50 s51 s52 s60 s61 s62 s70 s71 s80 s81 s100 s101 - automaton_state\n" + //
        "  ;   a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 - activity\n" + //
        "  ;   int cat - parameter_name\n" + //
        "  ;   int5 int10 int15 cat1 cat2 cat3 - value_name\n" + //
        "  ; )\n" + //
        "\n" + //
        "  ;; Majority: >=\n" + //
        "  ;; Minority: <=\n" + //
        "  ;; Interval: [, ]\n" + //
        "  ;; Equality: ==\n" + //
        "  ;; Inequality: !=\n" + //
        "  ;; If you want only > x, do conditions >= x && != x\n" + //
        "\n" + //
        "  (:predicates \n" + //
        "    ;; TRACES AND AUTOMATONS\n" + //
        "    (trace ?t1 - trace_state ?a - activity ?t2 - trace_state)\n" + //
        "    (automaton ?s1 - automaton_state ?a - activity ?s2 - automaton_state)\n" + //
        "    (cur_state ?t - trace_state)\n" + //
        "    (cur_state ?s - automaton_state)\n" + //
        "\n" + //
        "    ;; PARAMETER AND CONSTRAINT DECLARATION\n" + //
        "    (has_parameter ?a - activity ?pn - parameter_name ?t1 - trace_state ?t2 - trace_state)\n" + //
        "    (has_maj_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (has_min_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (has_interval_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (has_eq_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (has_ineq_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "\n" + //
        "    (invalid ?s1 - automaton_state ?a - activity ?s2 - automaton_state)\n" + //
        "    (complete_sync ?a - activity)\n" + //
        "    (after_sync)\n" + //
        "    (after_change)\n" + //
        "    (adding_value ?a - activity ?t1 - trace_state)\n" + //
        "    (after_add)\n" + //
        "\n" + //
        "    ; Declare this to indicate that such activity-parameter-value assignment exists.\n" + //
        "    (has_substitution_value ?vn - variable_name ?a - activity ?pn - parameter_name)\n" + //
        "    ; Indicates that the new activity has a new (defined) parameter.\n" + //
        "    (has_added_parameter ?a - activity ?par - parameter_name ?t1 - trace_state)\n" + //
        "\n" + //
        "    ; Used in the problem definition to indicate that this state must not be reached. In that case, the trace is **automatically** failed.\n" + //
        "    (failure_state ?s - automaton_state)\n" + //
        "    ; Used to indicate that the trace alignment couldn't possibly complete: prune -> less branching -> heap won't kaboom.\n" + //
        "    (failure)\n" + //
        "  )\n" + //
        "\n" + //
        "  (:functions\n" + //
        "    (total_cost)\n" + //
        "\n" + //
        "    ; There exists a value connected to the activity that occures between the two trace states.\n" + //
        "    (trace_parameter ?a - activity ?pn - parameter_name ?t1 - trace_state ?t2 - trace_state)\n" + //
        "\n" + //
        "    (majority_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (minority_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (interval_constraint_lower ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (interval_constraint_higher ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (equality_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "    (inequality_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "\n" + //
        "    ;; VARIABLES SUBSTITUTION / ADDITION\n" + //
        "    (variable_value ?var - value_name)\n" + //
        "    (added_parameter ?a - activity ?par - parameter_name ?t1 - trace_state)\n" + //
        "  )\n" + //
        "\n" + //
        "  ;; SYNC OPERATIONS\n" + //
        "  ;; ----------------------------------------------------------------------------------------------------\n" + //
        "  (:action sync\n" + //
        "    :parameters (?t1 - trace_state ?a - activity ?t2 - trace_state)\n" + //
        "    :precondition (and \n" + //
        "      (cur_state ?t1) \n" + //
        "      (trace ?t1 ?a ?t2) \n" + //
        "      (not (after_sync))\n" + //
        "      (not (after_add))\n" + //
        "      (not (failure)))\n" + //
        "    :effect (and \n" + //
        "      (increase (total_cost) 0)\n" + //
        "      (not (cur_state ?t1)) \n" + //
        "      (cur_state ?t2)\n" + //
        "      (not (after_change))\n" + //
        "      (after_sync)\n" + //
        "      (complete_sync ?a)\n" + //
        "\n" + //
        "      ; Check if case parameter is missing\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If parameter is missing\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (not (has_parameter ?a ?pn ?t1 ?t2))\n" + //
        "          (or\n" + //
        "            (has_maj_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_min_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_interval_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_eq_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_ineq_c ?a ?pn ?s1 ?s2)\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      ; Check for all conditions if a parameter is missing is not respecting a constraint\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not >=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_parameter ?a ?pn ?t1 ?t2)\n" + //
        "          (has_maj_c ?a ?pn ?s1 ?s2)\n" + //
        "          (< (trace_parameter ?a ?pn ?t1 ?t2) (majority_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not <=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_parameter ?a ?pn ?t1 ?t2) \n" + //
        "          (has_min_c ?a ?pn ?s1 ?s2)\n" + //
        "          (> (trace_parameter ?a ?pn ?t1 ?t2) (minority_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not [,]\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_parameter ?a ?pn ?t1 ?t2) \n" + //
        "          (has_interval_c ?a ?pn ?s1 ?s2)\n" + //
        "          (or\n" + //
        "            (< (trace_parameter ?a ?pn ?t1 ?t2) (interval_constraint_lower ?a ?pn ?s1 ?s2))\n" + //
        "            (> (trace_parameter ?a ?pn ?t1 ?t2) (interval_constraint_higher ?a ?pn ?s1 ?s2))\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not =\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_parameter ?a ?pn ?t1 ?t2) \n" + //
        "          (has_eq_c ?a ?pn ?s1 ?s2)\n" + //
        "          (or \n" + //
        "            (< (trace_parameter ?a ?pn ?t1 ?t2) (equality_constraint ?a ?pn ?s1 ?s2))\n" + //
        "            (> (trace_parameter ?a ?pn ?t1 ?t2) (equality_constraint ?a ?pn ?s1 ?s2))\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not !=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_parameter ?a ?pn ?t1 ?t2) \n" + //
        "          (has_ineq_c ?a ?pn ?s1 ?s2)\n" + //
        "          (= (trace_parameter ?a ?pn ?t1 ?t2) (inequality_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "    )\n" + //
        "  )\n" + //
        "\n" + //
        "  (:action move_automatons\n" + //
        "    :parameters (?a - activity)\n" + //
        "    :precondition (and\n" + //
        "      (not (after_change))\n" + //
        "      (after_sync)\n" + //
        "      (complete_sync ?a)\n" + //
        "      (not (failure))\n" + //
        "      (not (after_add))\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "      (increase (total_cost) 0)\n" + //
        "      (not (after_sync))\n" + //
        "      (not (complete_sync ?a))\n" + //
        "\n" + //
        "      (forall (?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        (when (and\n" + //
        "          (not (invalid ?s1 ?a ?s2))\n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (cur_state ?s1)\n" + //
        "          (not (failure_state ?s2))\n" + //
        "        ) (and\n" + //
        "          (not (cur_state ?s1))\n" + //
        "          (cur_state ?s2)\n" + //
        "        ))\n" + //
        "      )\n" + //
        "      (forall (?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        (when (and\n" + //
        "          (not (invalid ?s1 ?a ?s2))\n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (cur_state ?s1)\n" + //
        "          (failure_state ?s2)\n" + //
        "        ) (and\n" + //
        "          (not (cur_state ?s1))\n" + //
        "          (cur_state ?s2)\n" + //
        "          (failure)\n" + //
        "        ))\n" + //
        "      )\n" + //
        "\n" + //
        "      ;; Clean invalid arcs. In case the same activity repeats, we might have different values and thus different invalid automatons.\n" + //
        "      (forall (?s1 - automaton_state ?s2 - automaton_state) \n" + //
        "        (when (after_sync) ; Without the when enclosing, it crashes.\n" + //
        "          (not (invalid ?s1 ?a ?s2))))\n" + //
        "      )\n" + //
        "  )\n" + //
        "\n" + //
        "  ;; SUBSTITUTION\n" + //
        "  ;; ----------------------------------------------------------------------------------------------------\n" + //
        "  (:action change_value\n" + //
        "    :parameters (?a - activity ?t1 - trace_state ?t2 - trace_state ?pn - parameter_name ?vn - value_name)\n" + //
        "    :precondition (and \n" + //
        "      (trace ?t1 ?a ?t2)\n" + //
        "      (cur_state ?t1)\n" + //
        "      (not (failure))\n" + //
        "      (not (after_sync))\n" + //
        "      (not (after_add))\n" + //
        "      (has_substitution_value ?vn ?a ?pn)\n" + //
        "      ; TODO Check this:\n" + //
        "      (has_parameter ?a ?pn ?t1 ?t2)\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "      (after_change)\n" + //
        "      (increase (total_cost) " + CHANGE_VALUE_COST + ")\n" + //
        "      (has_parameter ?a ?pn ?t1 ?t2)\n" + //
        "      (assign (trace_parameter ?a ?pn ?t1 ?t2) (variable_value ?vn))\n" + //
        "  ))\n" + //
        "\n" + //
        "  ;; ADDITION\n" + //
        "  ;; ----------------------------------------------------------------------------------------------------\n" + //
        "  (:action add\n" + //
        "    :parameters (?a - activity ?t1 - trace_state)\n" + //
        "    :precondition (and \n" + //
        "      (cur_state ?t1) \n" + //
        "      (not (after_change))\n" + //
        "      (not (after_sync))\n" + //
        "      (not (failure))\n" + //
        "      (not (after_add))\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "      (increase (total_cost) " + ADD_VALUE_COST + ")\n" + //
        "      (adding_value ?a ?t1)\n" + //
        "      (after_add)\n" + //
        "  ))\n" + //
        "\n" + //
        "  (:action set_value\n" + //
        "    :parameters (?a - activity ?t1 - trace_state ?pn - parameter_name ?vn - value_name)\n" + //
        "    :precondition (and \n" + //
        "      (adding_value ?a ?t1)\n" + //
        "      (cur_state ?t1)\n" + //
        "      (not (failure))\n" + //
        "      (not (after_change))\n" + //
        "      (not (after_sync))\n" + //
        "      (after_add)\n" + //
        "      (has_substitution_value ?vn ?a ?pn)\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "      (increase (total_cost) " + SET_VALUE_COST + ")\n" + //
        "      (has_added_parameter ?a ?pn ?t1)\n" + //
        "      (assign (added_parameter ?a ?pn ?t1) (variable_value ?vn))\n" + //
        "  ))\n" + //
        "\n" + //
        "  (:action check_added_variables\n" + //
        "    :parameters (?a - activity ?t1 - trace_state)\n" + //
        "    :precondition (and \n" + //
        "      (adding_value ?a ?t1)\n" + //
        "      (cur_state ?t1)\n" + //
        "      (not (failure))\n" + //
        "      (not (after_change))\n" + //
        "      (not (after_sync))\n" + //
        "      (after_add)\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "\n" + //
        "      (not (adding_value ?a ?t1))\n" + //
        "      (not (after_add))\n" + //
        "      (after_sync)\n" + //
        "      (complete_sync ?a)\n" + //
        "\n" + //
        "      ; Check in case parameter is missing\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If parameter is missing\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (not (has_added_parameter ?a ?pn ?t1))\n" + //
        "          (or\n" + //
        "            (has_maj_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_min_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_interval_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_eq_c ?a ?pn ?s1 ?s2)\n" + //
        "            (has_ineq_c ?a ?pn ?s1 ?s2)\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      ; Check for all conditions if there is something to look for\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not >=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_added_parameter ?a ?pn ?t1)\n" + //
        "          (has_maj_c ?a ?pn ?s1 ?s2)\n" + //
        "          (< (added_parameter ?a ?pn ?t1) (majority_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not <=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_added_parameter ?a ?pn ?t1)\n" + //
        "          (has_min_c ?a ?pn ?s1 ?s2)\n" + //
        "          (> (added_parameter ?a ?pn ?t1) (minority_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not [,]\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_added_parameter ?a ?pn ?t1)\n" + //
        "          (has_interval_c ?a ?pn ?s1 ?s2)\n" + //
        "          (or\n" + //
        "            (< (added_parameter ?a ?pn ?t1) (interval_constraint_lower ?a ?pn ?s1 ?s2))\n" + //
        "            (> (added_parameter ?a ?pn ?t1) (interval_constraint_higher ?a ?pn ?s1 ?s2))\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not =\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_added_parameter ?a ?pn ?t1)\n" + //
        "          (has_eq_c ?a ?pn ?s1 ?s2)\n" + //
        "          (or \n" + //
        "            (< (added_parameter ?a ?pn ?t1) (equality_constraint ?a ?pn ?s1 ?s2))\n" + //
        "            (> (added_parameter ?a ?pn ?t1) (equality_constraint ?a ?pn ?s1 ?s2))\n" + //
        "          ))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      )\n" + //
        "\n" + //
        "      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)\n" + //
        "        ; If not !=\n" + //
        "        (when (and \n" + //
        "          (automaton ?s1 ?a ?s2)\n" + //
        "          (has_added_parameter ?a ?pn ?t1) \n" + //
        "          (has_ineq_c ?a ?pn ?s1 ?s2)\n" + //
        "          (= (added_parameter ?a ?pn ?t1) (inequality_constraint ?a ?pn ?s1 ?s2)))\n" + //
        "            (invalid ?s1 ?a ?s2))\n" + //
        "      ))\n" + //
        "  )\n" + //
        "\n" + //
        "  ;; DELETION\n" + //
        "  ;; ----------------------------------------------------------------------------------------------------\n" + //
        "  (:action del\n" + //
        "    :parameters (?t1 - trace_state ?a - activity ?t2 - trace_state)\n" + //
        "    :precondition (and \n" + //
        "      (cur_state ?t1) \n" + //
        "      (trace ?t1 ?a ?t2) \n" + //
        "      (not (after_change))\n" + //
        "      (not (after_sync))\n" + //
        "      (not (failure))\n" + //
        "      (not (after_add))\n" + //
        "    )\n" + //
        "    :effect (and \n" + //
        "      (increase (total_cost) " + DELETE_VALUE_COST + ")\n" + //
        "      (not (cur_state ?t1)) \n" + //
        "      (cur_state ?t2))\n" + //
        "  )\n" + //
        ")\n" + //
        "";
  
  // NOTE DEFINE COSTS ABOVE ^^^
  private final HashMap<String, Activity> activities;
  private final Automaton automaton;
  private final ArrayList<State> acceptingStates;
  private final ArrayList<Transition> relevantTransitions;
  
  
  public PDDLGenerator(DeclareModel model, String ltlString) throws Exception {
    this.activities = model.getActivities();
    this.automaton = LTL2Automaton.getInstance().translate(new DefaultParser(ltlString).parse());
    this.acceptingStates = findAcceptingStates();
    this.relevantTransitions = findRelevantTransitions();
    IOManager.getInstance().exportToDot(automaton);
  }
  
  
  private ArrayList<Transition> findRelevantTransitions() {
    ArrayList<Transition> relevantTransitions = new ArrayList<>();
    for (Transition transition : automaton.transitions()) {
      if (transition.getSource().getId() != transition.getTarget().getId()) {
        relevantTransitions.add(transition);
      }
    }
    return relevantTransitions;
  }
  
  private ArrayList<State> findAcceptingStates() {
    ArrayList<State> acceptingS = new ArrayList<>();
    for (State state : automaton) {
      if (state.isAccepting()) {
        acceptingS.add(state);
      }
    }
    return acceptingS;
  }
  
  
  //Section: Define domain PDDL
  // public String defineDomain() {
  //   StringBuilder builder = new StringBuilder(defineDomainDescription(new ArrayList<>(activities.keySet())));
  //   for (Map.Entry<String, Activity> activityEntry : activities.entrySet()) {
  //     Activity activity = activityEntry.getValue();
  //     builder.append(defineAddition(activity)).append(defineDeletion(activity)).append(defineReplacement(activity))
  //     .append(defineMissingReplacement(activity)).append(defineWrongReplacement(activity));
  //   }
  //   builder.append(defineSync()).append(defineGoTo()).append(")");
  //   return builder.toString();
  // }

  public String defineDomain() {
    return DOMAIN_STRING;
  }
  
  //Section: Generate problem PDDL based on trace
  public String generateProblem(ArrayList<String> sequence) {
    return "(define (problem Align)\n(:domain Mining)\n" + defineObjects(sequence.size()) +
    defineInit(sequence) + defineGoal(sequence.size()) + ")";
  }
  
  private String defineObjects(int traceSize) {
    return "(:objects\n" + defineTraceObjects(traceSize) + defineAutomataObjects() + defineActivityObjects() + ")\n";
  }
  
  private String defineTraceObjects(int traceSize) {
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i <= traceSize; i++) {
      builder.append("t").append(i).append(" ");
    }
    builder.append("- trace_state\n");
    return builder.toString();
  }
  
  private String defineAutomataObjects() {
    StringBuilder builder = new StringBuilder();
    for (State state : automaton) {
      builder.append(state).append(" ");
    }
    builder.append("s_abstract - automaton_state\n");
    return builder.toString();
  }
  
  private String defineActivityObjects() {
    StringBuilder builder = new StringBuilder();
    for (Map.Entry<String, Activity> activity : activities.entrySet()) {
      if (activity.getValue().getPartitions().isEmpty()) {
        builder.append(activity.getKey()).append(" - ").append(activity.getKey()).append("_activity\n");
      } else {
        for (String partition : activity.getValue().getPartitions().keySet()) {
          builder.append(partition).append(" ");
        }
        builder.append(activity.getKey()).append("_missing ").append(activity.getKey()).append("_wrong ")
        .append("- ").append(activity.getKey()).append("_activity\n");
      }
    }
    return builder.toString();
  }
  
  private String defineInit(ArrayList<String> sequence) {
    return "(:init\n(cur_state " + automaton.getInit() + ") (cur_state t0)\n" + defineFinalStates(sequence.size()) +
    defineTraceTransitions(sequence) + defineAutomataTransitions() + defineValidityBasedPredicates() +
    defineAtomsPredicates() + "(= (total-cost) 0)\n)\n";
  }
  
  private String defineFinalStates(int traceSize) {
    StringBuilder builder = new StringBuilder();
    for (State state : acceptingStates) {
      builder.append("(final_state ").append(state).append(") ");
    }
    builder.append("(final_state t").append(traceSize).append(")\n");
    return builder.toString();
  }
  
  private String defineTraceTransitions(ArrayList<String> sequence) {
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i < sequence.size(); i++) {
      builder.append("(trace t").append(i).append(" ").append(sequence.get(i)).append(" t").append(i + 1).append(")\n");
    }
    return builder.toString();
  }
  
  private String defineAutomataTransitions() {
    StringBuilder builder = new StringBuilder();
    for (Transition transition : relevantTransitions) {
      if (!transition.isNegative()) {
        builder.append("(automaton ").append(transition.getSource()).append(" ")
        .append(transition.getPositiveLabel()).append(" ").append(transition.getTarget()).append(")\n");
      } else {
        for (Map.Entry<String, Activity> activity : activities.entrySet()) {
          if (activity.getValue().getPartitions().isEmpty()) {
            builder.append("(automaton ").append(transition.getSource()).append(" ")
            .append(activity.getKey()).append(" ").append(transition.getTarget()).append(")\n");
          }
          for (String partitionKey : activity.getValue().getPartitions().keySet()) {
            if (!transition.getNegativeLabels().contains(partitionKey)) {
              builder.append("(automaton ").append(transition.getSource()).append(" ")
              .append(partitionKey).append(" ").append(transition.getTarget()).append(")\n");
            }
          }
        }
      }
    }
    return builder.toString();
  }
  
  private String defineValidityBasedPredicates() {
    StringBuilder builder = new StringBuilder();
    StringBuilder validAtoms = new StringBuilder();
    StringBuilder wrongReplacements = new StringBuilder();
    StringBuilder missingReplacements = new StringBuilder();
    for (Map.Entry<String, Activity> activity : activities.entrySet()) {
      if (activity.getValue().getPartitions().isEmpty()) {
        validAtoms.append("(valid ").append(activity.getKey()).append(")\n");
      } else if (activity.getValue().getPartitions().size() == 1) {
        validAtoms.append("(valid ").append(activity.getKey()).append("_p1)\n");
      } else {
        for (String partition : activity.getValue().getPartitions().keySet()) {
          validAtoms.append("(valid ").append(partition).append(") ");
          wrongReplacements.append("(missing ").append(activity.getKey()).append("_missing ").append(partition).append(") ");
          missingReplacements.append("(wrong ").append(activity.getKey()).append("_wrong ").append(partition).append(") ");
        }
        wrongReplacements.append("\n");
        missingReplacements.append("\n");
        validAtoms.append("\n");
      }
    }
    return builder.append(validAtoms).append(missingReplacements).append(wrongReplacements).toString();
  }
  
  private String defineAtomsPredicates() {
    StringBuilder builder = new StringBuilder();
    for (Map.Entry<String, Activity> activity : activities.entrySet()) {
      if (activity.getValue().getPartitions().size() > 1) {
        for (String partitionSource : activity.getValue().getPartitions().keySet()) {
          for (String partitionTarget : activity.getValue().getPartitions().keySet()) {
            if (!partitionSource.equals(partitionTarget)) {
              builder.append("(atoms ").append(partitionSource).append(" ").append(partitionTarget).append(") ");
            }
          }
          builder.append("\n");
        }
      }
    }
    return builder.toString();
  }
  
  
  
  private String defineGoal(int traceSize) {
    return "(:goal\n" + "(and " + "(cur_state t" + traceSize + ") " +
    "(cur_state s_abstract)\n" + "))\n" +
    "(:metric minimize (total-cost))\n";
  }
}