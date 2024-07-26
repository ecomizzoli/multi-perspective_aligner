(define (domain Mining)
	(:requirements :typing :equality :action-costs :conditional-effects)
	(:types
		state activity - object
		trace_state automaton_state - state
		a_activity b_activity c_activity d_activity e_activity - activity
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

	(:action add_a_activity
		:parameters (?s1 - automaton_state ?e - a_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action del_a_activity
		:parameters (?t1 - trace_state ?e - a_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect(and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_a_activity
		:parameters (?t1 - trace_state ?e1 - a_activity ?e2 - a_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a_missing
		:parameters (?t1 - trace_state ?e1 - a_activity ?e2 - a_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_a_wrong
		:parameters (?t1 - trace_state ?e1 - a_activity ?e2 - a_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_b_activity
		:parameters (?s1 - automaton_state ?e - b_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action del_b_activity
		:parameters (?t1 - trace_state ?e - b_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect(and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_b_activity
		:parameters (?t1 - trace_state ?e1 - b_activity ?e2 - b_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_b_missing
		:parameters (?t1 - trace_state ?e1 - b_activity ?e2 - b_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_b_wrong
		:parameters (?t1 - trace_state ?e1 - b_activity ?e2 - b_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_c_activity
		:parameters (?s1 - automaton_state ?e - c_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action del_c_activity
		:parameters (?t1 - trace_state ?e - c_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect(and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_c_activity
		:parameters (?t1 - trace_state ?e1 - c_activity ?e2 - c_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_c_missing
		:parameters (?t1 - trace_state ?e1 - c_activity ?e2 - c_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_c_wrong
		:parameters (?t1 - trace_state ?e1 - c_activity ?e2 - c_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_d_activity
		:parameters (?s1 - automaton_state ?e - d_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action del_d_activity
		:parameters (?t1 - trace_state ?e - d_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect(and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_d_activity
		:parameters (?t1 - trace_state ?e1 - d_activity ?e2 - d_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_d_missing
		:parameters (?t1 - trace_state ?e1 - d_activity ?e2 - d_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_d_wrong
		:parameters (?t1 - trace_state ?e1 - d_activity ?e2 - d_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (wrong ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action add_e_activity
		:parameters (?s1 - automaton_state ?e - e_activity ?s2 - automaton_state)
		:precondition (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
		:effect (and (increase (total-cost) 1)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action del_e_activity
		:parameters (?t1 - trace_state ?e - e_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e ?t2))
		:effect(and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2))
	)

	(:action repl_e_activity
		:parameters (?t1 - trace_state ?e1 - e_activity ?e2 - e_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (atoms ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_e_missing
		:parameters (?t1 - trace_state ?e1 - e_activity ?e2 - e_activity ?t2 - trace_state)
		:precondition (and (cur_state ?t1) (trace ?t1 ?e1 ?t2) (missing ?e1 ?e2))
		:effect (and (increase (total-cost) 1) (not (cur_state ?t1)) (cur_state ?t2)
			(forall (?s1 ?s2 - automaton_state)
				(when (and (cur_state ?s1) (automaton ?s1 ?e2 ?s2))
					(and (not (cur_state ?s1)) (cur_state ?s2))
	))))

	(:action repl_e_wrong
		:parameters (?t1 - trace_state ?e1 - e_activity ?e2 - e_activity ?t2 - trace_state)
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