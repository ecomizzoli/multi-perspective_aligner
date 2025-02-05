(define (domain trace-alignment)

  (:requirements :strips :typing :equality :adl :fluents :action-costs)

  (:types activity automaton_state trace_state parameter_name value_name)

  ; ; Constants for prob
  ; (:constants
  ;   t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - trace_state
  ;   s10 s11 s20 s21 s30 s31 s40 s41 s50 s51 s60 s61 s62 s70 s71 s72 s73 s80 s81 s82 - automaton_state
  ;   A B C D E F G - activity
  ;   x y z - parameter_name
  ;   a_x20 a_x40 a_y4 a_y6 a_z0 a_z1 c40 c30 c20 d10 d20 d40 e_x20 e_z0 e_z1 - value_name
  ; )

  ; ; Constants for prob2
  ; (:constants
  ;   t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - trace_state
  ;   s10 s11 s20 s21 s30 s31 s40 s41 s50 s51 s52 s60 s61 s62 s70 s71 s80 s81 s100 s101 - automaton_state
  ;   a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 - activity
  ;   int cat - parameter_name
  ;   int5 int10 int15 cat1 cat2 cat3 - value_name
  ; )

  ;; Majority: >=
  ;; Minority: <=
  ;; Interval: [, ]
  ;; Equality: ==
  ;; Inequality: !=
  ;; If you want only > x, do conditions >= x && != x

  (:predicates 
    ;; TRACES AND AUTOMATONS
    (trace ?t1 - trace_state ?a - activity ?t2 - trace_state)
    (automaton ?s1 - automaton_state ?a - activity ?s2 - automaton_state)
    (cur_t_state ?t - trace_state)
    (cur_s_state ?s - automaton_state)

    ;; PARAMETER AND CONSTRAINT DECLARATION
    (has_parameter ?a - activity ?pn - parameter_name ?t1 - trace_state ?t2 - trace_state)
    (has_maj_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (has_min_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (has_interval_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (has_eq_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (has_ineq_c ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)

    (invalid ?s1 - automaton_state ?a - activity ?s2 - automaton_state)
    (complete_sync ?a - activity)
    (after_sync)
    (after_change)
    (adding_value ?a - activity ?t1 - trace_state)
    (after_add)

    ; Declare this to indicate that such activity-parameter-value assignment exists.
    (has_substitution_value ?vn - value_name ?a - activity ?pn - parameter_name)
    ; Indicates that the new activity has a new (defined) parameter.
    (has_added_parameter ?a - activity ?par - parameter_name ?t1 - trace_state)

    ; Used in the problem definition to indicate that this state must not be reached. In that case, the trace is **automatically** failed.
    (failure_state ?s - automaton_state)
    ; Used to indicate that the trace alignment couldn't possibly complete: prune -> less branching -> heap won't kaboom.
    (failure)
  )

  (:functions
    (total_cost)

    ; There exists a value connected to the activity that occures between the two trace states.
    (trace_parameter ?a - activity ?pn - parameter_name ?t1 - trace_state ?t2 - trace_state)

    (majority_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (minority_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (interval_constraint_lower ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (interval_constraint_higher ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (equality_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
    (inequality_constraint ?a - activity ?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)

    ;; VARIABLES SUBSTITUTION / ADDITION
    (variable_value ?var - value_name)
    (added_parameter ?a - activity ?par - parameter_name ?t1 - trace_state)
  )

  ;; SYNC OPERATIONS
  ;; ----------------------------------------------------------------------------------------------------
  (:action sync
    :parameters (?t1 - trace_state ?a - activity ?t2 - trace_state)
    :precondition (and 
      (cur_t_state ?t1) 
      (trace ?t1 ?a ?t2) 
      (not (after_sync))
      (not (after_add))
      (not (failure)))
    :effect (and 
      (increase (total_cost) 0)
      (not (cur_t_state ?t1)) 
      (cur_t_state ?t2)
      (not (after_change))
      (after_sync)
      (complete_sync ?a)

      ; Check if case parameter is missing
      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If parameter is missing
        (when (and 
          (automaton ?s1 ?a ?s2)
          (not (has_parameter ?a ?pn ?t1 ?t2))
          (or
            (has_maj_c ?a ?pn ?s1 ?s2)
            (has_min_c ?a ?pn ?s1 ?s2)
            (has_interval_c ?a ?pn ?s1 ?s2)
            (has_eq_c ?a ?pn ?s1 ?s2)
            (has_ineq_c ?a ?pn ?s1 ?s2)
          ))
            (invalid ?s1 ?a ?s2))
      )

      ; Check for all conditions if a parameter is missing is not respecting a constraint
      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not >=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_parameter ?a ?pn ?t1 ?t2)
          (has_maj_c ?a ?pn ?s1 ?s2)
          (< (trace_parameter ?a ?pn ?t1 ?t2) (majority_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not <=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_parameter ?a ?pn ?t1 ?t2) 
          (has_min_c ?a ?pn ?s1 ?s2)
          (> (trace_parameter ?a ?pn ?t1 ?t2) (minority_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not [,]
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_parameter ?a ?pn ?t1 ?t2) 
          (has_interval_c ?a ?pn ?s1 ?s2)
          (or
            (< (trace_parameter ?a ?pn ?t1 ?t2) (interval_constraint_lower ?a ?pn ?s1 ?s2))
            (> (trace_parameter ?a ?pn ?t1 ?t2) (interval_constraint_higher ?a ?pn ?s1 ?s2))
          ))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not =
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_parameter ?a ?pn ?t1 ?t2) 
          (has_eq_c ?a ?pn ?s1 ?s2)
          (or 
            (< (trace_parameter ?a ?pn ?t1 ?t2) (equality_constraint ?a ?pn ?s1 ?s2))
            (> (trace_parameter ?a ?pn ?t1 ?t2) (equality_constraint ?a ?pn ?s1 ?s2))
          ))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not !=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_parameter ?a ?pn ?t1 ?t2) 
          (has_ineq_c ?a ?pn ?s1 ?s2)
          (= (trace_parameter ?a ?pn ?t1 ?t2) (inequality_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      )
    )
  )

  (:action move_automatons
    :parameters (?a - activity)
    :precondition (and
      (not (after_change))
      (after_sync)
      (complete_sync ?a)
      (not (failure))
      (not (after_add))
    )
    :effect (and 
      (increase (total_cost) 0)
      (not (after_sync))
      (not (complete_sync ?a))

      (forall (?s1 - automaton_state ?s2 - automaton_state)
        (when (and
          (not (invalid ?s1 ?a ?s2))
          (automaton ?s1 ?a ?s2)
          (cur_s_state ?s1)
          (not (failure_state ?s2))
        ) (and
          (not (cur_s_state ?s1))
          (cur_s_state ?s2)
        ))
      )
      (forall (?s1 - automaton_state ?s2 - automaton_state)
        (when (and
          (not (invalid ?s1 ?a ?s2))
          (automaton ?s1 ?a ?s2)
          (cur_s_state ?s1)
          (failure_state ?s2)
        ) (and
          (not (cur_s_state ?s1))
          (cur_s_state ?s2)
          (failure)
        ))
      )

      ;; Clean invalid arcs. In case the same activity repeats, we might have different values and thus different invalid automatons.
      (forall (?s1 - automaton_state ?s2 - automaton_state) 
        (when (after_sync) ; Without the when enclosing, it crashes.
          (not (invalid ?s1 ?a ?s2))))
      )
  )

  ;; SUBSTITUTION
  ;; ----------------------------------------------------------------------------------------------------
  (:action change_value
    :parameters (?a - activity ?t1 - trace_state ?t2 - trace_state ?pn - parameter_name ?vn - value_name)
    :precondition (and 
      (trace ?t1 ?a ?t2)
      (cur_t_state ?t1)
      (not (failure))
      (not (after_sync))
      (not (after_add))
      (has_substitution_value ?vn ?a ?pn)
      ; TODO Check this:
      (has_parameter ?a ?pn ?t1 ?t2)
    )
    :effect (and 
      (after_change)
      (increase (total_cost) 1)
      (has_parameter ?a ?pn ?t1 ?t2)
      (assign (trace_parameter ?a ?pn ?t1 ?t2) (variable_value ?vn))
  ))

  ;; ADDITION
  ;; ----------------------------------------------------------------------------------------------------
  (:action add
    :parameters (?a - activity ?t1 - trace_state)
    :precondition (and 
      (cur_t_state ?t1) 
      (not (after_change))
      (not (after_sync))
      (not (failure))
      (not (after_add))
    )
    :effect (and 
      (increase (total_cost) 2)
      (adding_value ?a ?t1)
      (after_add)
  ))

  (:action set_value
    :parameters (?a - activity ?t1 - trace_state ?pn - parameter_name ?vn - value_name)
    :precondition (and 
      (adding_value ?a ?t1)
      (cur_t_state ?t1)
      (not (failure))
      (not (after_change))
      (not (after_sync))
      (after_add)
      (has_substitution_value ?vn ?a ?pn)
    )
    :effect (and 
      (increase (total_cost) 1)
      (has_added_parameter ?a ?pn ?t1)
      (assign (added_parameter ?a ?pn ?t1) (variable_value ?vn))
  ))

  (:action check_added_variables
    :parameters (?a - activity ?t1 - trace_state)
    :precondition (and 
      (adding_value ?a ?t1)
      (cur_t_state ?t1)
      (not (failure))
      (not (after_change))
      (not (after_sync))
      (after_add)
    )
    :effect (and 

      (not (adding_value ?a ?t1))
      (not (after_add))
      (after_sync)
      (complete_sync ?a)

      ; Check in case parameter is missing
      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If parameter is missing
        (when (and 
          (automaton ?s1 ?a ?s2)
          (not (has_added_parameter ?a ?pn ?t1))
          (or
            (has_maj_c ?a ?pn ?s1 ?s2)
            (has_min_c ?a ?pn ?s1 ?s2)
            (has_interval_c ?a ?pn ?s1 ?s2)
            (has_eq_c ?a ?pn ?s1 ?s2)
            (has_ineq_c ?a ?pn ?s1 ?s2)
          ))
            (invalid ?s1 ?a ?s2))
      )

      ; Check for all conditions if there is something to look for
      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not >=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_added_parameter ?a ?pn ?t1)
          (has_maj_c ?a ?pn ?s1 ?s2)
          (< (added_parameter ?a ?pn ?t1) (majority_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not <=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_added_parameter ?a ?pn ?t1)
          (has_min_c ?a ?pn ?s1 ?s2)
          (> (added_parameter ?a ?pn ?t1) (minority_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not [,]
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_added_parameter ?a ?pn ?t1)
          (has_interval_c ?a ?pn ?s1 ?s2)
          (or
            (< (added_parameter ?a ?pn ?t1) (interval_constraint_lower ?a ?pn ?s1 ?s2))
            (> (added_parameter ?a ?pn ?t1) (interval_constraint_higher ?a ?pn ?s1 ?s2))
          ))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not =
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_added_parameter ?a ?pn ?t1)
          (has_eq_c ?a ?pn ?s1 ?s2)
          (or 
            (< (added_parameter ?a ?pn ?t1) (equality_constraint ?a ?pn ?s1 ?s2))
            (> (added_parameter ?a ?pn ?t1) (equality_constraint ?a ?pn ?s1 ?s2))
          ))
            (invalid ?s1 ?a ?s2))
      )

      (forall (?pn - parameter_name ?s1 - automaton_state ?s2 - automaton_state)
        ; If not !=
        (when (and 
          (automaton ?s1 ?a ?s2)
          (has_added_parameter ?a ?pn ?t1) 
          (has_ineq_c ?a ?pn ?s1 ?s2)
          (= (added_parameter ?a ?pn ?t1) (inequality_constraint ?a ?pn ?s1 ?s2)))
            (invalid ?s1 ?a ?s2))
      ))
  )

  ;; DELETION
  ;; ----------------------------------------------------------------------------------------------------
  (:action del
    :parameters (?t1 - trace_state ?a - activity ?t2 - trace_state)
    :precondition (and 
      (cur_t_state ?t1) 
      (trace ?t1 ?a ?t2) 
      (not (after_change))
      (not (after_sync))
      (not (failure))
      (not (after_add))
    )
    :effect (and 
      (increase (total_cost) 2)
      (not (cur_t_state ?t1)) 
      (cur_t_state ?t2))
  )
)
