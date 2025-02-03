(define (problem prob-trace)
  (:domain trace-alignment)

  (:objects
    t42 t39 t46 t21 t4 t30 t41 t43 t7 t14 t18 t44 t15 t17 t29 t1 t6 t38 t2 t16 t19 t8 t26 t13 t27 t25 t20 t12 t48 t23 t22 t35 t31 t45 t3 t9 t36 t10 t24 t37 t34 t32 t28 t47 t33 t40 t5 t49 t11 t0 - trace_state
    s1_1 s1_2 s1_3 s2_1 s2_2 s2_3 s3_1 s3_2 s3_3 s4_1 s4_2 s4_3 s5_1 s5_2 s5_3 s6_1 s6_2 s6_3 s7_1 s7_2 s7_3 s8_1 s8_2 s8_3 s9_1 s9_2 s9_3 s10_1 s10_2 s10_3 s10_4 - automaton_state
    a1 a2 a10 a3 a4 a5 a6 a7 a8 a9 - activity
    categorical integer - parameter_name
    c3 v15 c1 v5 c2 - value_name
  )
  (:init
    ;; SUBSTITUTION VARIABLES
    (= (variable_value c3) 3)
    (= (variable_value v15) 15)
    (= (variable_value c1) 1)
    (= (variable_value v5) 5)
    (= (variable_value c2) 2)

    (has_substitution_value c2 categorical)
    (has_substitution_value c3 categorical)
    (has_substitution_value v15 integer)
    (has_substitution_value v5 integer)
    (has_substitution_value c1 categorical)

    ;; TRACE DECLARATION
    (cur_t_state t0)
    (trace t0 a5 t1)
    (has_parameter a5 categorical t0 t1)
    (= (trace_parameter a5 categorical t0 t1) 3)
    (has_parameter a5 integer t0 t1)
    (= (trace_parameter a5 integer t0 t1) 10)

    (trace t1 a6 t2)
    (has_parameter a6 categorical t1 t2)
    (= (trace_parameter a6 categorical t1 t2) 2)
    (has_parameter a6 integer t1 t2)
    (= (trace_parameter a6 integer t1 t2) 88)

    (trace t2 a7 t3)
    (has_parameter a7 categorical t2 t3)
    (= (trace_parameter a7 categorical t2 t3) 2)
    (has_parameter a7 integer t2 t3)
    (= (trace_parameter a7 integer t2 t3) 79)

    (trace t3 a9 t4)
    (has_parameter a9 categorical t3 t4)
    (= (trace_parameter a9 categorical t3 t4) 2)
    (has_parameter a9 integer t3 t4)
    (= (trace_parameter a9 integer t3 t4) 33)

    (trace t4 a10 t5)
    (has_parameter a10 categorical t4 t5)
    (= (trace_parameter a10 categorical t4 t5) 2)
    (has_parameter a10 integer t4 t5)
    (= (trace_parameter a10 integer t4 t5) 34)

    (trace t5 a1 t6)
    (has_parameter a1 categorical t5 t6)
    (= (trace_parameter a1 categorical t5 t6) 2)
    (has_parameter a1 integer t5 t6)
    (= (trace_parameter a1 integer t5 t6) 97)

    (trace t6 a10 t7)
    (has_parameter a10 integer t6 t7)
    (= (trace_parameter a10 integer t6 t7) 10)
    (has_parameter a10 categorical t6 t7)
    (= (trace_parameter a10 categorical t6 t7) 3)

    (trace t7 a10 t8)
    (has_parameter a10 categorical t7 t8)
    (= (trace_parameter a10 categorical t7 t8) 3)
    (has_parameter a10 integer t7 t8)
    (= (trace_parameter a10 integer t7 t8) 10)

    (trace t8 a2 t9)
    (has_parameter a2 integer t8 t9)
    (= (trace_parameter a2 integer t8 t9) 1)
    (has_parameter a2 categorical t8 t9)
    (= (trace_parameter a2 categorical t8 t9) 2)

    (trace t9 a5 t10)
    (has_parameter a5 integer t9 t10)
    (= (trace_parameter a5 integer t9 t10) 4)
    (has_parameter a5 categorical t9 t10)
    (= (trace_parameter a5 categorical t9 t10) 3)

    (trace t10 a1 t11)
    (has_parameter a1 integer t10 t11)
    (= (trace_parameter a1 integer t10 t11) 0)
    (has_parameter a1 categorical t10 t11)
    (= (trace_parameter a1 categorical t10 t11) 1)

    (trace t11 a4 t12)
    (has_parameter a4 categorical t11 t12)
    (= (trace_parameter a4 categorical t11 t12) 2)
    (has_parameter a4 integer t11 t12)
    (= (trace_parameter a4 integer t11 t12) 7)

    (trace t12 a3 t13)
    (has_parameter a3 categorical t12 t13)
    (= (trace_parameter a3 categorical t12 t13) 1)
    (has_parameter a3 integer t12 t13)
    (= (trace_parameter a3 integer t12 t13) 10)

    (trace t13 a10 t14)
    (has_parameter a10 categorical t13 t14)
    (= (trace_parameter a10 categorical t13 t14) 3)
    (has_parameter a10 integer t13 t14)
    (= (trace_parameter a10 integer t13 t14) 10)

    (trace t14 a4 t15)
    (has_parameter a4 categorical t14 t15)
    (= (trace_parameter a4 categorical t14 t15) 2)
    (has_parameter a4 integer t14 t15)
    (= (trace_parameter a4 integer t14 t15) 10)

    (trace t15 a5 t16)
    (has_parameter a5 categorical t15 t16)
    (= (trace_parameter a5 categorical t15 t16) 3)
    (has_parameter a5 integer t15 t16)
    (= (trace_parameter a5 integer t15 t16) 10)

    (trace t16 a7 t17)
    (has_parameter a7 categorical t16 t17)
    (= (trace_parameter a7 categorical t16 t17) 2)
    (has_parameter a7 integer t16 t17)
    (= (trace_parameter a7 integer t16 t17) 34)

    (trace t17 a7 t18)
    (has_parameter a7 integer t17 t18)
    (= (trace_parameter a7 integer t17 t18) 65)
    (has_parameter a7 categorical t17 t18)
    (= (trace_parameter a7 categorical t17 t18) 2)

    (trace t18 a7 t19)
    (has_parameter a7 integer t18 t19)
    (= (trace_parameter a7 integer t18 t19) 48)
    (has_parameter a7 categorical t18 t19)
    (= (trace_parameter a7 categorical t18 t19) 2)

    (trace t19 a10 t20)
    (has_parameter a10 categorical t19 t20)
    (= (trace_parameter a10 categorical t19 t20) 3)
    (has_parameter a10 integer t19 t20)
    (= (trace_parameter a10 integer t19 t20) 10)

    (trace t20 a4 t21)
    (has_parameter a4 integer t20 t21)
    (= (trace_parameter a4 integer t20 t21) 10)
    (has_parameter a4 categorical t20 t21)
    (= (trace_parameter a4 categorical t20 t21) 2)

    (trace t21 a5 t22)
    (has_parameter a5 integer t21 t22)
    (= (trace_parameter a5 integer t21 t22) 10)
    (has_parameter a5 categorical t21 t22)
    (= (trace_parameter a5 categorical t21 t22) 3)

    (trace t22 a4 t23)
    (has_parameter a4 categorical t22 t23)
    (= (trace_parameter a4 categorical t22 t23) 2)
    (has_parameter a4 integer t22 t23)
    (= (trace_parameter a4 integer t22 t23) 10)

    (trace t23 a4 t24)
    (has_parameter a4 categorical t23 t24)
    (= (trace_parameter a4 categorical t23 t24) 2)
    (has_parameter a4 integer t23 t24)
    (= (trace_parameter a4 integer t23 t24) 10)

    (trace t24 a4 t25)
    (has_parameter a4 integer t24 t25)
    (= (trace_parameter a4 integer t24 t25) 10)
    (has_parameter a4 categorical t24 t25)
    (= (trace_parameter a4 categorical t24 t25) 2)

    (trace t25 a5 t26)
    (has_parameter a5 categorical t25 t26)
    (= (trace_parameter a5 categorical t25 t26) 3)
    (has_parameter a5 integer t25 t26)
    (= (trace_parameter a5 integer t25 t26) 10)

    (trace t26 a10 t27)
    (has_parameter a10 categorical t26 t27)
    (= (trace_parameter a10 categorical t26 t27) 3)
    (has_parameter a10 integer t26 t27)
    (= (trace_parameter a10 integer t26 t27) 10)

    (trace t27 a7 t28)
    (has_parameter a7 categorical t27 t28)
    (= (trace_parameter a7 categorical t27 t28) 2)
    (has_parameter a7 integer t27 t28)
    (= (trace_parameter a7 integer t27 t28) 42)

    (trace t28 a4 t29)
    (has_parameter a4 integer t28 t29)
    (= (trace_parameter a4 integer t28 t29) 10)
    (has_parameter a4 categorical t28 t29)
    (= (trace_parameter a4 categorical t28 t29) 2)

    (trace t29 a4 t30)
    (has_parameter a4 categorical t29 t30)
    (= (trace_parameter a4 categorical t29 t30) 2)
    (has_parameter a4 integer t29 t30)
    (= (trace_parameter a4 integer t29 t30) 10)

    (trace t30 a4 t31)
    (has_parameter a4 integer t30 t31)
    (= (trace_parameter a4 integer t30 t31) 10)
    (has_parameter a4 categorical t30 t31)
    (= (trace_parameter a4 categorical t30 t31) 2)

    (trace t31 a4 t32)
    (has_parameter a4 categorical t31 t32)
    (= (trace_parameter a4 categorical t31 t32) 2)
    (has_parameter a4 integer t31 t32)
    (= (trace_parameter a4 integer t31 t32) 10)

    (trace t32 a10 t33)
    (has_parameter a10 integer t32 t33)
    (= (trace_parameter a10 integer t32 t33) 10)
    (has_parameter a10 categorical t32 t33)
    (= (trace_parameter a10 categorical t32 t33) 3)

    (trace t33 a7 t34)
    (has_parameter a7 integer t33 t34)
    (= (trace_parameter a7 integer t33 t34) 68)
    (has_parameter a7 categorical t33 t34)
    (= (trace_parameter a7 categorical t33 t34) 2)

    (trace t34 a5 t35)
    (has_parameter a5 categorical t34 t35)
    (= (trace_parameter a5 categorical t34 t35) 3)
    (has_parameter a5 integer t34 t35)
    (= (trace_parameter a5 integer t34 t35) 10)

    (trace t35 a4 t36)
    (has_parameter a4 integer t35 t36)
    (= (trace_parameter a4 integer t35 t36) 10)
    (has_parameter a4 categorical t35 t36)
    (= (trace_parameter a4 categorical t35 t36) 2)

    (trace t36 a4 t37)
    (has_parameter a4 categorical t36 t37)
    (= (trace_parameter a4 categorical t36 t37) 2)
    (has_parameter a4 integer t36 t37)
    (= (trace_parameter a4 integer t36 t37) 10)

    (trace t37 a4 t38)
    (has_parameter a4 categorical t37 t38)
    (= (trace_parameter a4 categorical t37 t38) 2)
    (has_parameter a4 integer t37 t38)
    (= (trace_parameter a4 integer t37 t38) 10)

    (trace t38 a10 t39)
    (has_parameter a10 integer t38 t39)
    (= (trace_parameter a10 integer t38 t39) 10)
    (has_parameter a10 categorical t38 t39)
    (= (trace_parameter a10 categorical t38 t39) 3)

    (trace t39 a7 t40)
    (has_parameter a7 categorical t39 t40)
    (= (trace_parameter a7 categorical t39 t40) 2)
    (has_parameter a7 integer t39 t40)
    (= (trace_parameter a7 integer t39 t40) 62)

    (trace t40 a5 t41)
    (has_parameter a5 categorical t40 t41)
    (= (trace_parameter a5 categorical t40 t41) 3)
    (has_parameter a5 integer t40 t41)
    (= (trace_parameter a5 integer t40 t41) 10)

    (trace t41 a4 t42)
    (has_parameter a4 integer t41 t42)
    (= (trace_parameter a4 integer t41 t42) 10)
    (has_parameter a4 categorical t41 t42)
    (= (trace_parameter a4 categorical t41 t42) 2)

    (trace t42 a4 t43)
    (has_parameter a4 categorical t42 t43)
    (= (trace_parameter a4 categorical t42 t43) 2)
    (has_parameter a4 integer t42 t43)
    (= (trace_parameter a4 integer t42 t43) 10)

    (trace t43 a4 t44)
    (has_parameter a4 categorical t43 t44)
    (= (trace_parameter a4 categorical t43 t44) 2)
    (has_parameter a4 integer t43 t44)
    (= (trace_parameter a4 integer t43 t44) 10)

    (trace t44 a10 t45)
    (has_parameter a10 categorical t44 t45)
    (= (trace_parameter a10 categorical t44 t45) 3)
    (has_parameter a10 integer t44 t45)
    (= (trace_parameter a10 integer t44 t45) 10)

    (trace t45 a4 t46)
    (has_parameter a4 integer t45 t46)
    (= (trace_parameter a4 integer t45 t46) 10)
    (has_parameter a4 categorical t45 t46)
    (= (trace_parameter a4 categorical t45 t46) 2)

    (trace t46 a5 t47)
    (has_parameter a5 categorical t46 t47)
    (= (trace_parameter a5 categorical t46 t47) 3)
    (has_parameter a5 integer t46 t47)
    (= (trace_parameter a5 integer t46 t47) 10)

    (trace t47 a4 t48)
    (has_parameter a4 integer t47 t48)
    (= (trace_parameter a4 integer t47 t48) 10)
    (has_parameter a4 categorical t47 t48)
    (= (trace_parameter a4 categorical t47 t48) 2)

    (trace t48 a4 t49)
    (has_parameter a4 integer t48 t49)
    (= (trace_parameter a4 integer t48 t49) 10)
    (has_parameter a4 categorical t48 t49)
    (= (trace_parameter a4 categorical t48 t49) 2)

    ;; AUTOMATON STATES
    (cur_s_state s1_1)
    (automaton s1_1 a5 s1_2)
    (has_eq_c a5 categorical s1_1 s1_2)
    (= (equality_constraint a5 categorical s1_1 s1_2) 3)

    (cur_s_state s2_1)
    (automaton s2_1 a10 s2_2)
    (has_eq_c a10 categorical s2_1 s2_2)
    (= (equality_constraint a10 categorical s2_1 s2_2) 3)

    (cur_s_state s3_1)
    (automaton s3_1 a7 s3_2)
    (has_maj_c a7 integer s3_1 s3_2)
    (= (majority_constraint a7 integer s3_1 s3_2) 10)
    (has_ineq_c a7 integer s3_1 s3_2)
    (= (inequality_constraint a7 integer s3_1 s3_2) 10)

    (cur_s_state s4_1)
    (automaton s4_1 a1 s4_2)
    (has_maj_c a1 integer s4_1 s4_2)
    (= (majority_constraint a1 integer s4_1 s4_2) 10)
    (has_ineq_c a1 integer s4_1 s4_2)
    (= (inequality_constraint a1 integer s4_1 s4_2) 10)
    (automaton s4_2 a2 s4_1)
    (has_min_c a2 integer s4_2 s4_1)
    (= (minority_constraint a2 integer s4_2 s4_1) 10)
    (has_ineq_c a2 integer s4_2 s4_1)
    (= (inequality_constraint a2 integer s4_2 s4_1) 10)

    (cur_s_state s5_1)
    (automaton s5_1 a3 s5_2)
    (has_eq_c a3 categorical s5_1 s5_2)
    (= (equality_constraint a3 categorical s5_1 s5_2) 1)
    (automaton s5_2 a4 s5_1)
    (has_eq_c a4 categorical s5_2 s5_1)
    (= (equality_constraint a4 categorical s5_2 s5_1) 2)

    (cur_s_state s6_1)
    (automaton s6_1 a5 s6_2)
    (has_eq_c a5 categorical s6_1 s6_2)
    (= (equality_constraint a5 categorical s6_1 s6_2) 3)
    (automaton s6_2 a7 s6_1)
    (has_maj_c a7 integer s6_2 s6_1)
    (= (majority_constraint a7 integer s6_2 s6_1) 10)
    (has_ineq_c a7 integer s6_2 s6_1)
    (= (inequality_constraint a7 integer s6_2 s6_1) 10)

    (cur_s_state s7_1)
    (failure_state s7_3)
    (automaton s7_1 a6 s7_2)
    (has_maj_c a6 integer s7_1 s7_2)
    (= (majority_constraint a6 integer s7_1 s7_2) 10)
    (has_ineq_c a6 integer s7_1 s7_2)
    (= (inequality_constraint a6 integer s7_1 s7_2) 10)
    (automaton s7_2 a7 s7_1)
    (has_maj_c a7 integer s7_2 s7_1)
    (= (majority_constraint a7 integer s7_2 s7_1) 10)
    (has_ineq_c a7 integer s7_2 s7_1)
    (= (inequality_constraint a7 integer s7_2 s7_1) 10)
    (automaton s7_2 a7 s7_3)
    (has_min_c a7 integer s7_2 s7_3)
    (= (minority_constraint a7 integer s7_2 s7_3) 10)
    (automaton s7_2 a1 s7_3)
    (automaton s7_2 a2 s7_3)
    (automaton s7_2 a10 s7_3)
    (automaton s7_2 a3 s7_3)
    (automaton s7_2 a4 s7_3)
    (automaton s7_2 a5 s7_3)
    (automaton s7_2 a6 s7_3)
    (automaton s7_2 a7 s7_3)
    (automaton s7_2 a8 s7_3)
    (automaton s7_2 a9 s7_3)

    (cur_s_state s8_1)
    (failure_state s8_3)
    (automaton s8_1 a1 s8_2)
    (has_eq_c a1 categorical s8_1 s8_2)
    (= (equality_constraint a1 categorical s8_1 s8_2) 1)
    (automaton s8_2 a4 s8_1)
    (has_eq_c a4 categorical s8_2 s8_1)
    (= (equality_constraint a4 categorical s8_2 s8_1) 2)
    (automaton s8_2 a4 s8_3)
    (has_ineq_c a4 categorical s8_2 s8_3)
    (= (inequality_constraint a4 categorical s8_2 s8_3) 2)
    (automaton s8_2 a1 s8_3)
    (automaton s8_2 a2 s8_3)
    (automaton s8_2 a10 s8_3)
    (automaton s8_2 a3 s8_3)
    (automaton s8_2 a4 s8_3)
    (automaton s8_2 a5 s8_3)
    (automaton s8_2 a6 s8_3)
    (automaton s8_2 a7 s8_3)
    (automaton s8_2 a8 s8_3)
    (automaton s8_2 a9 s8_3)

    (cur_s_state s9_1)
    (automaton s9_1 a9 s9_2)
    (has_maj_c a9 integer s9_1 s9_2)
    (= (majority_constraint a9 integer s9_1 s9_2) 10)
    (has_ineq_c a9 integer s9_1 s9_2)
    (= (inequality_constraint a9 integer s9_1 s9_2) 10)
    (automaton s9_2 a10 s9_1)
    (has_maj_c a10 integer s9_2 s9_1)
    (= (majority_constraint a10 integer s9_2 s9_1) 10)
    (has_ineq_c a10 integer s9_2 s9_1)
    (= (inequality_constraint a10 integer s9_2 s9_1) 10)

    (cur_s_state s10_1)
    (failure_state s10_4)
    (automaton s10_1 a8 s10_2)
    (has_eq_c a8 categorical s10_1 s10_2)
    (= (equality_constraint a8 categorical s10_1 s10_2) 1)
    (automaton s10_1 a5 s10_3)
    (has_eq_c a5 categorical s10_1 s10_3)
    (= (equality_constraint a5 categorical s10_1 s10_3) 3)
    (automaton s10_2 a8 s10_4)
    (has_eq_c a8 categorical s10_2 s10_4)
    (= (equality_constraint a8 categorical s10_2 s10_4) 1)
    (automaton s10_3 a5 s10_4)
    (has_eq_c a5 categorical s10_3 s10_4)
    (= (equality_constraint a5 categorical s10_3 s10_4) 3)

  )
  ;; GOAL STATES
  (:goal (and
    (cur_t_state t49)
    (cur_s_state s1_2)
    (cur_s_state s2_2)
    (cur_s_state s3_2)
    (cur_s_state s4_1)
    (cur_s_state s5_1)
    (cur_s_state s6_1)
    (cur_s_state s7_1)
    (cur_s_state s8_1)
    (cur_s_state s9_1)
    (or
      (cur_s_state s10_2)
      (cur_s_state s10_3)
    )
    (not (failure))
    (not (after_change))
    (not (after_add))
    (not (after_sync))
  ))

  (:metric minimize (total_cost))
)

