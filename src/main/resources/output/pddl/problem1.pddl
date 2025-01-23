(define (problem prob-trace)
  (:domain trace-alignment)

  (:objects
    t41 t16 t17 t7 t6 t45 t42 t34 t37 t8 t4 t49 t35 t29 t28 t9 t31 t44 t12 t25 t40 t1 t2 t30 t32 t20 t5 t46 t22 t3 t36 t27 t13 t14 t0 t21 t48 t26 t47 t23 t11 t33 t10 t24 t39 t38 t19 t43 t15 t18 - trace_state
    s1_1 s1_2 s2_1 s2_2 s3_1 s3_2 s4_1 s4_2 s5_1 s5_2 s6_1 s6_2 s7_1 s7_2 s8_1 s8_2 s9_1 s9_2 s10_1 s10_2 - automaton_state
    a1 a2 a10 a3 a4 a5 a6 a7 a8 a9 - activity
    categorical integer - parameter_name
  )
  ;; TRACE DECLARATION
  (:init
    (cur_state t0)
    (trace t0 a10 t1)
    (has_parameter a10 integer t0 t1)
    (= (trace_parameter a10 integer t0 t1) 5)

    (has_parameter a10 categorical t0 t1)
    (= (trace_parameter a10 categorical t0 t1) 3)

    (trace t1 a5 t2)
    (has_parameter a5 integer t1 t2)
    (= (trace_parameter a5 integer t1 t2) 66)

    (has_parameter a5 categorical t1 t2)
    (= (trace_parameter a5 categorical t1 t2) 3)

    (trace t2 a3 t3)
    (has_parameter a3 categorical t2 t3)
    (= (trace_parameter a3 categorical t2 t3) 1)

    (has_parameter a3 integer t2 t3)
    (= (trace_parameter a3 integer t2 t3) 90)

    (trace t3 a1 t4)
    (has_parameter a1 categorical t3 t4)
    (= (trace_parameter a1 categorical t3 t4) 1)

    (has_parameter a1 integer t3 t4)
    (= (trace_parameter a1 integer t3 t4) 10)

    (trace t4 a4 t5)
    (has_parameter a4 categorical t4 t5)
    (= (trace_parameter a4 categorical t4 t5) 2)

    (has_parameter a4 integer t4 t5)
    (= (trace_parameter a4 integer t4 t5) 10)

    (trace t5 a6 t6)
    (has_parameter a6 integer t5 t6)
    (= (trace_parameter a6 integer t5 t6) 95)

    (has_parameter a6 categorical t5 t6)
    (= (trace_parameter a6 categorical t5 t6) 2)

    (trace t6 a7 t7)
    (has_parameter a7 categorical t6 t7)
    (= (trace_parameter a7 categorical t6 t7) 1)

    (has_parameter a7 integer t6 t7)
    (= (trace_parameter a7 integer t6 t7) 77)

    (trace t7 a10 t8)
    (has_parameter a10 integer t7 t8)
    (= (trace_parameter a10 integer t7 t8) 10)

    (has_parameter a10 categorical t7 t8)
    (= (trace_parameter a10 categorical t7 t8) 3)

    (trace t8 a7 t9)
    (has_parameter a7 categorical t8 t9)
    (= (trace_parameter a7 categorical t8 t9) 2)

    (has_parameter a7 integer t8 t9)
    (= (trace_parameter a7 integer t8 t9) 91)

    (trace t9 a5 t10)
    (has_parameter a5 integer t9 t10)
    (= (trace_parameter a5 integer t9 t10) 10)

    (has_parameter a5 categorical t9 t10)
    (= (trace_parameter a5 categorical t9 t10) 3)

    (trace t10 a3 t11)
    (has_parameter a3 categorical t10 t11)
    (= (trace_parameter a3 categorical t10 t11) 2)

    (has_parameter a3 integer t10 t11)
    (= (trace_parameter a3 integer t10 t11) 10)

    (trace t11 a2 t12)
    (has_parameter a2 integer t11 t12)
    (= (trace_parameter a2 integer t11 t12) 10)

    (has_parameter a2 categorical t11 t12)
    (= (trace_parameter a2 categorical t11 t12) 2)

    (trace t12 a1 t13)
    (has_parameter a1 integer t12 t13)
    (= (trace_parameter a1 integer t12 t13) 10)

    (has_parameter a1 categorical t12 t13)
    (= (trace_parameter a1 categorical t12 t13) 2)

    (trace t13 a9 t14)
    (has_parameter a9 categorical t13 t14)
    (= (trace_parameter a9 categorical t13 t14) 2)

    (has_parameter a9 integer t13 t14)
    (= (trace_parameter a9 integer t13 t14) 5)

    (trace t14 a10 t15)
    (has_parameter a10 integer t14 t15)
    (= (trace_parameter a10 integer t14 t15) 10)

    (has_parameter a10 categorical t14 t15)
    (= (trace_parameter a10 categorical t14 t15) 3)

    (trace t15 a5 t16)
    (has_parameter a5 categorical t15 t16)
    (= (trace_parameter a5 categorical t15 t16) 3)

    (has_parameter a5 integer t15 t16)
    (= (trace_parameter a5 integer t15 t16) 10)

    (trace t16 a1 t17)
    (has_parameter a1 integer t16 t17)
    (= (trace_parameter a1 integer t16 t17) 81)

    (has_parameter a1 categorical t16 t17)
    (= (trace_parameter a1 categorical t16 t17) 2)

    (trace t17 a10 t18)
    (has_parameter a10 categorical t17 t18)
    (= (trace_parameter a10 categorical t17 t18) 2)

    (has_parameter a10 integer t17 t18)
    (= (trace_parameter a10 integer t17 t18) 17)

    (trace t18 a7 t19)
    (has_parameter a7 categorical t18 t19)
    (= (trace_parameter a7 categorical t18 t19) 2)

    (has_parameter a7 integer t18 t19)
    (= (trace_parameter a7 integer t18 t19) 76)

    (trace t19 a10 t20)
    (has_parameter a10 integer t19 t20)
    (= (trace_parameter a10 integer t19 t20) 10)

    (has_parameter a10 categorical t19 t20)
    (= (trace_parameter a10 categorical t19 t20) 3)

    (trace t20 a7 t21)
    (has_parameter a7 integer t20 t21)
    (= (trace_parameter a7 integer t20 t21) 87)

    (has_parameter a7 categorical t20 t21)
    (= (trace_parameter a7 categorical t20 t21) 2)

    (trace t21 a5 t22)
    (has_parameter a5 categorical t21 t22)
    (= (trace_parameter a5 categorical t21 t22) 3)

    (has_parameter a5 integer t21 t22)
    (= (trace_parameter a5 integer t21 t22) 10)

    (trace t22 a3 t23)
    (has_parameter a3 integer t22 t23)
    (= (trace_parameter a3 integer t22 t23) 10)

    (has_parameter a3 categorical t22 t23)
    (= (trace_parameter a3 categorical t22 t23) 2)

    (trace t23 a5 t24)
    (has_parameter a5 categorical t23 t24)
    (= (trace_parameter a5 categorical t23 t24) 2)

    (has_parameter a5 integer t23 t24)
    (= (trace_parameter a5 integer t23 t24) 10)

    (trace t24 a2 t25)
    (has_parameter a2 integer t24 t25)
    (= (trace_parameter a2 integer t24 t25) 10)

    (has_parameter a2 categorical t24 t25)
    (= (trace_parameter a2 categorical t24 t25) 2)

    (trace t25 a10 t26)
    (has_parameter a10 categorical t25 t26)
    (= (trace_parameter a10 categorical t25 t26) 3)

    (has_parameter a10 integer t25 t26)
    (= (trace_parameter a10 integer t25 t26) 10)

    (trace t26 a5 t27)
    (has_parameter a5 integer t26 t27)
    (= (trace_parameter a5 integer t26 t27) 10)

    (has_parameter a5 categorical t26 t27)
    (= (trace_parameter a5 categorical t26 t27) 3)

    (trace t27 a7 t28)
    (has_parameter a7 categorical t27 t28)
    (= (trace_parameter a7 categorical t27 t28) 2)

    (has_parameter a7 integer t27 t28)
    (= (trace_parameter a7 integer t27 t28) 99)

    (trace t28 a3 t29)
    (has_parameter a3 integer t28 t29)
    (= (trace_parameter a3 integer t28 t29) 10)

    (has_parameter a3 categorical t28 t29)
    (= (trace_parameter a3 categorical t28 t29) 2)

    (trace t29 a9 t30)
    (has_parameter a9 integer t29 t30)
    (= (trace_parameter a9 integer t29 t30) 48)

    (has_parameter a9 categorical t29 t30)
    (= (trace_parameter a9 categorical t29 t30) 2)

    (trace t30 a2 t31)
    (has_parameter a2 integer t30 t31)
    (= (trace_parameter a2 integer t30 t31) 4)

    (has_parameter a2 categorical t30 t31)
    (= (trace_parameter a2 categorical t30 t31) 2)

    (trace t31 a3 t32)
    (has_parameter a3 integer t31 t32)
    (= (trace_parameter a3 integer t31 t32) 10)

    (has_parameter a3 categorical t31 t32)
    (= (trace_parameter a3 categorical t31 t32) 2)

    (trace t32 a10 t33)
    (has_parameter a10 integer t32 t33)
    (= (trace_parameter a10 integer t32 t33) 10)

    (has_parameter a10 categorical t32 t33)
    (= (trace_parameter a10 categorical t32 t33) 3)

    (trace t33 a7 t34)
    (has_parameter a7 integer t33 t34)
    (= (trace_parameter a7 integer t33 t34) 32)

    (has_parameter a7 categorical t33 t34)
    (= (trace_parameter a7 categorical t33 t34) 2)

    (trace t34 a5 t35)
    (has_parameter a5 categorical t34 t35)
    (= (trace_parameter a5 categorical t34 t35) 3)

    (has_parameter a5 integer t34 t35)
    (= (trace_parameter a5 integer t34 t35) 10)

    (trace t35 a10 t36)
    (has_parameter a10 integer t35 t36)
    (= (trace_parameter a10 integer t35 t36) 28)

    (has_parameter a10 categorical t35 t36)
    (= (trace_parameter a10 categorical t35 t36) 2)

    (trace t36 a5 t37)
    (has_parameter a5 categorical t36 t37)
    (= (trace_parameter a5 categorical t36 t37) 2)

    (has_parameter a5 integer t36 t37)
    (= (trace_parameter a5 integer t36 t37) 10)

    (trace t37 a9 t38)
    (has_parameter a9 integer t37 t38)
    (= (trace_parameter a9 integer t37 t38) 10)

    (has_parameter a9 categorical t37 t38)
    (= (trace_parameter a9 categorical t37 t38) 2)

    (trace t38 a10 t39)
    (has_parameter a10 categorical t38 t39)
    (= (trace_parameter a10 categorical t38 t39) 3)

    (has_parameter a10 integer t38 t39)
    (= (trace_parameter a10 integer t38 t39) 10)

    (trace t39 a7 t40)
    (has_parameter a7 integer t39 t40)
    (= (trace_parameter a7 integer t39 t40) 33)

    (has_parameter a7 categorical t39 t40)
    (= (trace_parameter a7 categorical t39 t40) 2)

    (trace t40 a5 t41)
    (has_parameter a5 categorical t40 t41)
    (= (trace_parameter a5 categorical t40 t41) 3)

    (has_parameter a5 integer t40 t41)
    (= (trace_parameter a5 integer t40 t41) 10)

    (trace t41 a9 t42)
    (has_parameter a9 categorical t41 t42)
    (= (trace_parameter a9 categorical t41 t42) 2)

    (has_parameter a9 integer t41 t42)
    (= (trace_parameter a9 integer t41 t42) 10)

    (trace t42 a9 t43)
    (has_parameter a9 integer t42 t43)
    (= (trace_parameter a9 integer t42 t43) 10)

    (has_parameter a9 categorical t42 t43)
    (= (trace_parameter a9 categorical t42 t43) 2)

    (trace t43 a5 t44)
    (has_parameter a5 categorical t43 t44)
    (= (trace_parameter a5 categorical t43 t44) 2)

    (has_parameter a5 integer t43 t44)
    (= (trace_parameter a5 integer t43 t44) 10)

    (trace t44 a10 t45)
    (has_parameter a10 integer t44 t45)
    (= (trace_parameter a10 integer t44 t45) 10)

    (has_parameter a10 categorical t44 t45)
    (= (trace_parameter a10 categorical t44 t45) 3)

    (trace t45 a1 t46)
    (has_parameter a1 categorical t45 t46)
    (= (trace_parameter a1 categorical t45 t46) 2)

    (has_parameter a1 integer t45 t46)
    (= (trace_parameter a1 integer t45 t46) 10)

    (trace t46 a5 t47)
    (has_parameter a5 integer t46 t47)
    (= (trace_parameter a5 integer t46 t47) 10)

    (has_parameter a5 categorical t46 t47)
    (= (trace_parameter a5 categorical t46 t47) 3)

    (trace t47 a7 t48)
    (has_parameter a7 categorical t47 t48)
    (= (trace_parameter a7 categorical t47 t48) 2)

    (has_parameter a7 integer t47 t48)
    (= (trace_parameter a7 integer t47 t48) 45)

    (trace t48 a7 t49)
    (has_parameter a7 categorical t48 t49)
    (= (trace_parameter a7 categorical t48 t49) 2)

    (has_parameter a7 integer t48 t49)
    (= (trace_parameter a7 integer t48 t49) 10)

    ;; AUTOMATON STATES
    (cur_state s1_s1_1)
    (failure_state s1_s1_2)
    (automaton s1_s1_1 a5 s1_s1_2)

    (cur_state s2_s2_1)
    (failure_state s2_s2_2)
    (automaton s2_s2_1 a10 s2_s2_2)

    (cur_state s3_s3_1)
    (failure_state s3_s3_2)
    (automaton s3_s3_1 a7 s3_s3_2)

    (cur_state s4_s4_1)
    (failure_state s4_s4_2)
    (automaton s4_s4_1 a1 s4_s4_2)

    (cur_state s5_s5_1)
    (failure_state s5_s5_2)
    (automaton s5_s5_1 a3 s5_s5_2)

    (cur_state s6_s6_1)
    (failure_state s6_s6_2)
    (automaton s6_s6_1 a5 s6_s6_2)

    (cur_state s7_s7_1)
    (failure_state s7_s7_2)
    (automaton s7_s7_1 a6 s7_s7_2)

    (cur_state s8_s8_1)
    (failure_state s8_s8_2)
    (automaton s8_s8_1 a1 s8_s8_2)

    (cur_state s9_s9_1)
    (failure_state s9_s9_2)
    (automaton s9_s9_1 a9 s9_s9_2)

    (cur_state s10_s10_1)
    (failure_state s10_s10_2)
    (automaton s10_s10_1 a8 s10_s10_2)

  )
  ;; GOAL STATES
  (:goal (and
    (cur_state t0)
    (cur_state s1_1)
    (cur_state s2_1)
    (cur_state s3_1)
    (cur_state s4_1)
    (cur_state s5_1)
    (cur_state s6_1)
    (cur_state s7_1)
    (cur_state s8_1)
    (cur_state s9_1)
    (cur_state s10_1)
    (not (failure))
    (not (after_change))
    (not (after_add))
    (not (after_sync))
  )

  (:metric minimize (total_cost))
)

