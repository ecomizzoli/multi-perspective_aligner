(define (domain Mining)
	(:requirements :typing :equality :action-costs :conditional-effects)
	(:types
		state activity - object
		trace_state automaton_state - state
		a1_activity a2_activity a10_activity a3_activity a4_activity a5_activity a6_activity a7_activity a8_activity a9_activity - activity
	)

	(:predicates
		(trace ?t1 - trace_state ?e - activity ?t2 - trace_state)
		(automaton ?s1 - automaton_state ?e - activity ?s2 - automaton_state)
		(atoms ?e1 - activity ?e2 - activity)
		(missing ?e1 - activity ?e2 - activity)
		(wrong ?e1 - activity ?e2 - activity)
		(valid ?e1 - activity)
		(cur_state ?s - state)
		(final_state ?s - state)
	)

	(:functions
		(total-cost) - number
	)

	(:action add_a1_activity
		:parameters (?s1 - automaton_state ?e - a1_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a1_activity
		:parameters (?t1 - trace_state ?e - a1_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a1_activity
		:parameters (?t1 - trace_state ?e1 - a1_activity ?e2 - a1_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a1_missing
		:parameters (?t1 - trace_state ?e1 - a1_activity ?e2 - a1_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a1_wrong
		:parameters (?t1 - trace_state ?e1 - a1_activity ?e2 - a1_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a2_activity
		:parameters (?s1 - automaton_state ?e - a2_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a2_activity
		:parameters (?t1 - trace_state ?e - a2_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a2_activity
		:parameters (?t1 - trace_state ?e1 - a2_activity ?e2 - a2_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a2_missing
		:parameters (?t1 - trace_state ?e1 - a2_activity ?e2 - a2_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a2_wrong
		:parameters (?t1 - trace_state ?e1 - a2_activity ?e2 - a2_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a10_activity
		:parameters (?s1 - automaton_state ?e - a10_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a10_activity
		:parameters (?t1 - trace_state ?e - a10_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a10_activity
		:parameters (?t1 - trace_state ?e1 - a10_activity ?e2 - a10_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a10_missing
		:parameters (?t1 - trace_state ?e1 - a10_activity ?e2 - a10_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a10_wrong
		:parameters (?t1 - trace_state ?e1 - a10_activity ?e2 - a10_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a3_activity
		:parameters (?s1 - automaton_state ?e - a3_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a3_activity
		:parameters (?t1 - trace_state ?e - a3_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a3_activity
		:parameters (?t1 - trace_state ?e1 - a3_activity ?e2 - a3_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a3_missing
		:parameters (?t1 - trace_state ?e1 - a3_activity ?e2 - a3_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a3_wrong
		:parameters (?t1 - trace_state ?e1 - a3_activity ?e2 - a3_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a4_activity
		:parameters (?s1 - automaton_state ?e - a4_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a4_activity
		:parameters (?t1 - trace_state ?e - a4_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a4_activity
		:parameters (?t1 - trace_state ?e1 - a4_activity ?e2 - a4_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a4_missing
		:parameters (?t1 - trace_state ?e1 - a4_activity ?e2 - a4_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a4_wrong
		:parameters (?t1 - trace_state ?e1 - a4_activity ?e2 - a4_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a5_activity
		:parameters (?s1 - automaton_state ?e - a5_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a5_activity
		:parameters (?t1 - trace_state ?e - a5_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a5_activity
		:parameters (?t1 - trace_state ?e1 - a5_activity ?e2 - a5_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a5_missing
		:parameters (?t1 - trace_state ?e1 - a5_activity ?e2 - a5_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a5_wrong
		:parameters (?t1 - trace_state ?e1 - a5_activity ?e2 - a5_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a6_activity
		:parameters (?s1 - automaton_state ?e - a6_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a6_activity
		:parameters (?t1 - trace_state ?e - a6_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a6_activity
		:parameters (?t1 - trace_state ?e1 - a6_activity ?e2 - a6_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a6_missing
		:parameters (?t1 - trace_state ?e1 - a6_activity ?e2 - a6_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a6_wrong
		:parameters (?t1 - trace_state ?e1 - a6_activity ?e2 - a6_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a7_activity
		:parameters (?s1 - automaton_state ?e - a7_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a7_activity
		:parameters (?t1 - trace_state ?e - a7_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a7_activity
		:parameters (?t1 - trace_state ?e1 - a7_activity ?e2 - a7_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a7_missing
		:parameters (?t1 - trace_state ?e1 - a7_activity ?e2 - a7_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a7_wrong
		:parameters (?t1 - trace_state ?e1 - a7_activity ?e2 - a7_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a8_activity
		:parameters (?s1 - automaton_state ?e - a8_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a8_activity
		:parameters (?t1 - trace_state ?e - a8_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a8_activity
		:parameters (?t1 - trace_state ?e1 - a8_activity ?e2 - a8_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a8_missing
		:parameters (?t1 - trace_state ?e1 - a8_activity ?e2 - a8_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a8_wrong
		:parameters (?t1 - trace_state ?e1 - a8_activity ?e2 - a8_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_a9_activity
		:parameters (?s1 - automaton_state ?e - a9_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action del_a9_activity
		:parameters (?t1 - trace_state ?e - a9_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a9_activity
		:parameters (?t1 - trace_state ?e1 - a9_activity ?e2 - a9_activity ?t2 - trace_state ?s1 - automaton_state ?s2 - automaton_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2) (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2) (not (cur_state ?s1)) (cur_state ?s2)
	))

	(:action repl_a9_missing
		:parameters (?t1 - trace_state ?e1 - a9_activity ?e2 - a9_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a9_wrong
		:parameters (?t1 - trace_state ?e1 - a9_activity ?e2 - a9_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action sync
		:parameters (?t1 - trace_state ?e - activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2) (valid ?e))
		:effect (and (increase (total-cost) 0) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action goto
		:parameters (?s1 - automaton_state ?s2 - automaton_state ?t1 - trace_state)
		:precondition (and (final_state ?s1) (cur_state ?s1) (final_state ?t1) (cur_state ?t1))
		:effect (and (increase (total-cost) 0) (not (cur_state ?s1)) (cur_state ?s2))
	)
)