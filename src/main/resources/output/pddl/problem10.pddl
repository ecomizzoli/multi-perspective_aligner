(define (problem prob-trace)
  (:domain trace-alignment)

  (:objects
    t87 t92 t44 t61 t36 t16 t49 t9 t42 t95 t57 t25 t39 t4 t30 t85 t89 t68 t40 t3 t66 t47 t23 t13 t12 t20 t52 t6 t17 t62 t31 t53 t24 t65 t74 t18 t32 t94 t37 t76 t90 t99 t73 t33 t46 t48 t63 t26 t88 t86 t59 t10 t60 t38 t91 t51 t96 t0 t41 t7 t84 t21 t34 t1 t43 t5 t79 t75 t80 t2 t56 t22 t19 t64 t50 t28 t69 t70 t67 t82 t45 t58 t81 t15 t55 t11 t97 t29 t35 t78 t93 t8 t14 t77 t54 t27 t98 t72 t71 t83 - trace_state
    s1_1 s1_2 s1_3 s2_1 s2_2 s2_3 s3_1 s3_2 s3_3 s4_1 s4_2 s4_3 s5_1 s5_2 s5_3 s6_1 s6_2 s6_3 s7_1 s7_2 s7_3 s8_1 s8_2 s8_3 s9_1 s9_2 s9_3 s10_1 s10_2 s10_3 s10_4 - automaton_state
    a1 a2 a10 a3 a4 a5 a6 a7 a8 a9 - activity
    categorical integer - parameter_name
    c3 v15 c1 v5 c2 - value_name
  )
  (:init

    ; Leave below if you want to use Metric-FF, otherwise zero states are found. Bug?
    (= (total_cost) 0)

    ;; SUBSTITUTION VARIABLES
    (= (variable_value c3) 3)
    (= (variable_value v15) 15)
    (= (variable_value c1) 1)
    (= (variable_value v5) 5)
    (= (variable_value c2) 2)

    (has_substitution_value c2 a1 categorical)
    (has_substitution_value c1 a10 categorical)
    (has_substitution_value c1 a9 categorical)
    (has_substitution_value c2 a9 categorical)
    (has_substitution_value v5 a4 integer)
    (has_substitution_value c1 a3 categorical)
    (has_substitution_value v5 a10 integer)
    (has_substitution_value c2 a6 categorical)
    (has_substitution_value c2 a8 categorical)
    (has_substitution_value c2 a3 categorical)
    (has_substitution_value v5 a5 integer)
    (has_substitution_value v15 a5 integer)
    (has_substitution_value v5 a9 integer)
    (has_substitution_value c3 a1 categorical)
    (has_substitution_value c2 a2 categorical)
    (has_substitution_value c3 a10 categorical)
    (has_substitution_value c1 a1 categorical)
    (has_substitution_value c3 a8 categorical)
    (has_substitution_value c1 a8 categorical)
    (has_substitution_value v15 a3 integer)
    (has_substitution_value c1 a6 categorical)
    (has_substitution_value c3 a4 categorical)
    (has_substitution_value v5 a8 integer)
    (has_substitution_value v5 a2 integer)
    (has_substitution_value c1 a2 categorical)
    (has_substitution_value c3 a5 categorical)
    (has_substitution_value v5 a3 integer)
    (has_substitution_value c3 a9 categorical)
    (has_substitution_value v5 a1 integer)
    (has_substitution_value v15 a7 integer)
    (has_substitution_value v15 a9 integer)
    (has_substitution_value c3 a6 categorical)
    (has_substitution_value c1 a7 categorical)
    (has_substitution_value v15 a2 integer)
    (has_substitution_value c1 a5 categorical)
    (has_substitution_value v15 a1 integer)
    (has_substitution_value v15 a8 integer)
    (has_substitution_value c2 a5 categorical)
    (has_substitution_value v5 a7 integer)
    (has_substitution_value v15 a6 integer)
    (has_substitution_value c3 a2 categorical)
    (has_substitution_value c1 a4 categorical)
    (has_substitution_value c3 a7 categorical)
    (has_substitution_value v15 a4 integer)
    (has_substitution_value v5 a6 integer)
    (has_substitution_value c2 a10 categorical)
    (has_substitution_value v15 a10 integer)
    (has_substitution_value c2 a4 categorical)
    (has_substitution_value c2 a7 categorical)
    (has_substitution_value c3 a3 categorical)

    ;; TRACE DECLARATION
    (cur_t_state t0)
    (trace t0 a4 t1)
    (has_parameter a4 integer t0 t1)
    (= (trace_parameter a4 integer t0 t1) 4)
    (has_parameter a4 categorical t0 t1)
    (= (trace_parameter a4 categorical t0 t1) 3)

    (trace t1 a9 t2)
    (has_parameter a9 integer t1 t2)
    (= (trace_parameter a9 integer t1 t2) 10)
    (has_parameter a9 categorical t1 t2)
    (= (trace_parameter a9 categorical t1 t2) 3)

    (trace t2 a5 t3)
    (has_parameter a5 categorical t2 t3)
    (= (trace_parameter a5 categorical t2 t3) 3)
    (has_parameter a5 integer t2 t3)
    (= (trace_parameter a5 integer t2 t3) 10)

    (trace t3 a9 t4)
    (has_parameter a9 integer t3 t4)
    (= (trace_parameter a9 integer t3 t4) 10)
    (has_parameter a9 categorical t3 t4)
    (= (trace_parameter a9 categorical t3 t4) 2)

    (trace t4 a7 t5)
    (has_parameter a7 categorical t4 t5)
    (= (trace_parameter a7 categorical t4 t5) 2)
    (has_parameter a7 integer t4 t5)
    (= (trace_parameter a7 integer t4 t5) 93)

    (trace t5 a3 t6)
    (has_parameter a3 integer t5 t6)
    (= (trace_parameter a3 integer t5 t6) 100)
    (has_parameter a3 categorical t5 t6)
    (= (trace_parameter a3 categorical t5 t6) 2)

    (trace t6 a10 t7)
    (has_parameter a10 integer t6 t7)
    (= (trace_parameter a10 integer t6 t7) 10)
    (has_parameter a10 categorical t6 t7)
    (= (trace_parameter a10 categorical t6 t7) 1)

    (trace t7 a1 t8)
    (has_parameter a1 integer t7 t8)
    (= (trace_parameter a1 integer t7 t8) 35)
    (has_parameter a1 categorical t7 t8)
    (= (trace_parameter a1 categorical t7 t8) 2)

    (trace t8 a1 t9)
    (has_parameter a1 integer t8 t9)
    (= (trace_parameter a1 integer t8 t9) 10)
    (has_parameter a1 categorical t8 t9)
    (= (trace_parameter a1 categorical t8 t9) 2)

    (trace t9 a5 t10)
    (has_parameter a5 integer t9 t10)
    (= (trace_parameter a5 integer t9 t10) 64)
    (has_parameter a5 categorical t9 t10)
    (= (trace_parameter a5 categorical t9 t10) 2)

    (trace t10 a5 t11)
    (has_parameter a5 categorical t10 t11)
    (= (trace_parameter a5 categorical t10 t11) 3)
    (has_parameter a5 integer t10 t11)
    (= (trace_parameter a5 integer t10 t11) 10)

    (trace t11 a9 t12)
    (has_parameter a9 categorical t11 t12)
    (= (trace_parameter a9 categorical t11 t12) 2)
    (has_parameter a9 integer t11 t12)
    (= (trace_parameter a9 integer t11 t12) 10)

    (trace t12 a1 t13)
    (has_parameter a1 categorical t12 t13)
    (= (trace_parameter a1 categorical t12 t13) 2)
    (has_parameter a1 integer t12 t13)
    (= (trace_parameter a1 integer t12 t13) 1)

    (trace t13 a1 t14)
    (has_parameter a1 categorical t13 t14)
    (= (trace_parameter a1 categorical t13 t14) 2)
    (has_parameter a1 integer t13 t14)
    (= (trace_parameter a1 integer t13 t14) 10)

    (trace t14 a5 t15)
    (has_parameter a5 categorical t14 t15)
    (= (trace_parameter a5 categorical t14 t15) 2)
    (has_parameter a5 integer t14 t15)
    (= (trace_parameter a5 integer t14 t15) 10)

    (trace t15 a2 t16)
    (has_parameter a2 integer t15 t16)
    (= (trace_parameter a2 integer t15 t16) 10)
    (has_parameter a2 categorical t15 t16)
    (= (trace_parameter a2 categorical t15 t16) 1)

    (trace t16 a7 t17)
    (has_parameter a7 integer t16 t17)
    (= (trace_parameter a7 integer t16 t17) 6)
    (has_parameter a7 categorical t16 t17)
    (= (trace_parameter a7 categorical t16 t17) 1)

    (trace t17 a9 t18)
    (has_parameter a9 categorical t17 t18)
    (= (trace_parameter a9 categorical t17 t18) 3)
    (has_parameter a9 integer t17 t18)
    (= (trace_parameter a9 integer t17 t18) 38)

    (trace t18 a5 t19)
    (has_parameter a5 categorical t18 t19)
    (= (trace_parameter a5 categorical t18 t19) 1)
    (has_parameter a5 integer t18 t19)
    (= (trace_parameter a5 integer t18 t19) 10)

    (trace t19 a7 t20)
    (has_parameter a7 integer t19 t20)
    (= (trace_parameter a7 integer t19 t20) 45)
    (has_parameter a7 categorical t19 t20)
    (= (trace_parameter a7 categorical t19 t20) 3)

    (trace t20 a5 t21)
    (has_parameter a5 integer t20 t21)
    (= (trace_parameter a5 integer t20 t21) 1)
    (has_parameter a5 categorical t20 t21)
    (= (trace_parameter a5 categorical t20 t21) 1)

    (trace t21 a6 t22)
    (has_parameter a6 categorical t21 t22)
    (= (trace_parameter a6 categorical t21 t22) 2)
    (has_parameter a6 integer t21 t22)
    (= (trace_parameter a6 integer t21 t22) 10)

    (trace t22 a3 t23)
    (has_parameter a3 categorical t22 t23)
    (= (trace_parameter a3 categorical t22 t23) 1)
    (has_parameter a3 integer t22 t23)
    (= (trace_parameter a3 integer t22 t23) 2)

    (trace t23 a8 t24)
    (has_parameter a8 integer t23 t24)
    (= (trace_parameter a8 integer t23 t24) 10)
    (has_parameter a8 categorical t23 t24)
    (= (trace_parameter a8 categorical t23 t24) 2)

    (trace t24 a10 t25)
    (has_parameter a10 categorical t24 t25)
    (= (trace_parameter a10 categorical t24 t25) 2)
    (has_parameter a10 integer t24 t25)
    (= (trace_parameter a10 integer t24 t25) 10)

    (trace t25 a10 t26)
    (has_parameter a10 categorical t25 t26)
    (= (trace_parameter a10 categorical t25 t26) 2)
    (has_parameter a10 integer t25 t26)
    (= (trace_parameter a10 integer t25 t26) 100)

    (trace t26 a4 t27)
    (has_parameter a4 categorical t26 t27)
    (= (trace_parameter a4 categorical t26 t27) 2)
    (has_parameter a4 integer t26 t27)
    (= (trace_parameter a4 integer t26 t27) 96)

    (trace t27 a2 t28)
    (has_parameter a2 integer t27 t28)
    (= (trace_parameter a2 integer t27 t28) 1)
    (has_parameter a2 categorical t27 t28)
    (= (trace_parameter a2 categorical t27 t28) 2)

    (trace t28 a10 t29)
    (has_parameter a10 integer t28 t29)
    (= (trace_parameter a10 integer t28 t29) 10)
    (has_parameter a10 categorical t28 t29)
    (= (trace_parameter a10 categorical t28 t29) 2)

    (trace t29 a10 t30)
    (has_parameter a10 integer t29 t30)
    (= (trace_parameter a10 integer t29 t30) 10)
    (has_parameter a10 categorical t29 t30)
    (= (trace_parameter a10 categorical t29 t30) 3)

    (trace t30 a2 t31)
    (has_parameter a2 integer t30 t31)
    (= (trace_parameter a2 integer t30 t31) 100)
    (has_parameter a2 categorical t30 t31)
    (= (trace_parameter a2 categorical t30 t31) 3)

    (trace t31 a2 t32)
    (has_parameter a2 integer t31 t32)
    (= (trace_parameter a2 integer t31 t32) 85)
    (has_parameter a2 categorical t31 t32)
    (= (trace_parameter a2 categorical t31 t32) 2)

    (trace t32 a10 t33)
    (has_parameter a10 integer t32 t33)
    (= (trace_parameter a10 integer t32 t33) 10)
    (has_parameter a10 categorical t32 t33)
    (= (trace_parameter a10 categorical t32 t33) 2)

    (trace t33 a9 t34)
    (has_parameter a9 categorical t33 t34)
    (= (trace_parameter a9 categorical t33 t34) 3)
    (has_parameter a9 integer t33 t34)
    (= (trace_parameter a9 integer t33 t34) 10)

    (trace t34 a5 t35)
    (has_parameter a5 integer t34 t35)
    (= (trace_parameter a5 integer t34 t35) 0)
    (has_parameter a5 categorical t34 t35)
    (= (trace_parameter a5 categorical t34 t35) 2)

    (trace t35 a7 t36)
    (has_parameter a7 categorical t35 t36)
    (= (trace_parameter a7 categorical t35 t36) 2)
    (has_parameter a7 integer t35 t36)
    (= (trace_parameter a7 integer t35 t36) 9)

    (trace t36 a6 t37)
    (has_parameter a6 categorical t36 t37)
    (= (trace_parameter a6 categorical t36 t37) 2)
    (has_parameter a6 integer t36 t37)
    (= (trace_parameter a6 integer t36 t37) 10)

    (trace t37 a5 t38)
    (has_parameter a5 integer t37 t38)
    (= (trace_parameter a5 integer t37 t38) 9)
    (has_parameter a5 categorical t37 t38)
    (= (trace_parameter a5 categorical t37 t38) 3)

    (trace t38 a3 t39)
    (has_parameter a3 integer t38 t39)
    (= (trace_parameter a3 integer t38 t39) 59)
    (has_parameter a3 categorical t38 t39)
    (= (trace_parameter a3 categorical t38 t39) 3)

    (trace t39 a10 t40)
    (has_parameter a10 categorical t39 t40)
    (= (trace_parameter a10 categorical t39 t40) 1)
    (has_parameter a10 integer t39 t40)
    (= (trace_parameter a10 integer t39 t40) 10)

    (trace t40 a2 t41)
    (has_parameter a2 categorical t40 t41)
    (= (trace_parameter a2 categorical t40 t41) 1)
    (has_parameter a2 integer t40 t41)
    (= (trace_parameter a2 integer t40 t41) 1)

    (trace t41 a1 t42)
    (has_parameter a1 categorical t41 t42)
    (= (trace_parameter a1 categorical t41 t42) 2)
    (has_parameter a1 integer t41 t42)
    (= (trace_parameter a1 integer t41 t42) 59)

    (trace t42 a1 t43)
    (has_parameter a1 categorical t42 t43)
    (= (trace_parameter a1 categorical t42 t43) 3)
    (has_parameter a1 integer t42 t43)
    (= (trace_parameter a1 integer t42 t43) 10)

    (trace t43 a9 t44)
    (has_parameter a9 categorical t43 t44)
    (= (trace_parameter a9 categorical t43 t44) 1)
    (has_parameter a9 integer t43 t44)
    (= (trace_parameter a9 integer t43 t44) 10)

    (trace t44 a5 t45)
    (has_parameter a5 integer t44 t45)
    (= (trace_parameter a5 integer t44 t45) 8)
    (has_parameter a5 categorical t44 t45)
    (= (trace_parameter a5 categorical t44 t45) 2)

    (trace t45 a6 t46)
    (has_parameter a6 integer t45 t46)
    (= (trace_parameter a6 integer t45 t46) 10)
    (has_parameter a6 categorical t45 t46)
    (= (trace_parameter a6 categorical t45 t46) 1)

    (trace t46 a9 t47)
    (has_parameter a9 integer t46 t47)
    (= (trace_parameter a9 integer t46 t47) 9)
    (has_parameter a9 categorical t46 t47)
    (= (trace_parameter a9 categorical t46 t47) 2)

    (trace t47 a1 t48)
    (has_parameter a1 integer t47 t48)
    (= (trace_parameter a1 integer t47 t48) 10)
    (has_parameter a1 categorical t47 t48)
    (= (trace_parameter a1 categorical t47 t48) 2)

    (trace t48 a4 t49)
    (has_parameter a4 categorical t48 t49)
    (= (trace_parameter a4 categorical t48 t49) 2)
    (has_parameter a4 integer t48 t49)
    (= (trace_parameter a4 integer t48 t49) 59)

    (trace t49 a2 t50)
    (has_parameter a2 categorical t49 t50)
    (= (trace_parameter a2 categorical t49 t50) 1)
    (has_parameter a2 integer t49 t50)
    (= (trace_parameter a2 integer t49 t50) 0)

    (trace t50 a7 t51)
    (has_parameter a7 categorical t50 t51)
    (= (trace_parameter a7 categorical t50 t51) 3)
    (has_parameter a7 integer t50 t51)
    (= (trace_parameter a7 integer t50 t51) 87)

    (trace t51 a5 t52)
    (has_parameter a5 categorical t51 t52)
    (= (trace_parameter a5 categorical t51 t52) 3)
    (has_parameter a5 integer t51 t52)
    (= (trace_parameter a5 integer t51 t52) 10)

    (trace t52 a5 t53)
    (has_parameter a5 integer t52 t53)
    (= (trace_parameter a5 integer t52 t53) 0)
    (has_parameter a5 categorical t52 t53)
    (= (trace_parameter a5 categorical t52 t53) 2)

    (trace t53 a8 t54)
    (has_parameter a8 categorical t53 t54)
    (= (trace_parameter a8 categorical t53 t54) 2)
    (has_parameter a8 integer t53 t54)
    (= (trace_parameter a8 integer t53 t54) 10)

    (trace t54 a1 t55)
    (has_parameter a1 integer t54 t55)
    (= (trace_parameter a1 integer t54 t55) 84)
    (has_parameter a1 categorical t54 t55)
    (= (trace_parameter a1 categorical t54 t55) 3)

    (trace t55 a5 t56)
    (has_parameter a5 integer t55 t56)
    (= (trace_parameter a5 integer t55 t56) 4)
    (has_parameter a5 categorical t55 t56)
    (= (trace_parameter a5 categorical t55 t56) 3)

    (trace t56 a4 t57)
    (has_parameter a4 integer t56 t57)
    (= (trace_parameter a4 integer t56 t57) 1)
    (has_parameter a4 categorical t56 t57)
    (= (trace_parameter a4 categorical t56 t57) 3)

    (trace t57 a4 t58)
    (has_parameter a4 categorical t57 t58)
    (= (trace_parameter a4 categorical t57 t58) 1)
    (has_parameter a4 integer t57 t58)
    (= (trace_parameter a4 integer t57 t58) 5)

    (trace t58 a3 t59)
    (has_parameter a3 categorical t58 t59)
    (= (trace_parameter a3 categorical t58 t59) 1)
    (has_parameter a3 integer t58 t59)
    (= (trace_parameter a3 integer t58 t59) 51)

    (trace t59 a9 t60)
    (has_parameter a9 integer t59 t60)
    (= (trace_parameter a9 integer t59 t60) 56)
    (has_parameter a9 categorical t59 t60)
    (= (trace_parameter a9 categorical t59 t60) 3)

    (trace t60 a2 t61)
    (has_parameter a2 categorical t60 t61)
    (= (trace_parameter a2 categorical t60 t61) 2)
    (has_parameter a2 integer t60 t61)
    (= (trace_parameter a2 integer t60 t61) 0)

    (trace t61 a7 t62)
    (has_parameter a7 categorical t61 t62)
    (= (trace_parameter a7 categorical t61 t62) 2)
    (has_parameter a7 integer t61 t62)
    (= (trace_parameter a7 integer t61 t62) 99)

    (trace t62 a2 t63)
    (has_parameter a2 categorical t62 t63)
    (= (trace_parameter a2 categorical t62 t63) 2)
    (has_parameter a2 integer t62 t63)
    (= (trace_parameter a2 integer t62 t63) 10)

    (trace t63 a5 t64)
    (has_parameter a5 integer t63 t64)
    (= (trace_parameter a5 integer t63 t64) 10)
    (has_parameter a5 categorical t63 t64)
    (= (trace_parameter a5 categorical t63 t64) 2)

    (trace t64 a9 t65)
    (has_parameter a9 integer t64 t65)
    (= (trace_parameter a9 integer t64 t65) 8)
    (has_parameter a9 categorical t64 t65)
    (= (trace_parameter a9 categorical t64 t65) 3)

    (trace t65 a4 t66)
    (has_parameter a4 integer t65 t66)
    (= (trace_parameter a4 integer t65 t66) 10)
    (has_parameter a4 categorical t65 t66)
    (= (trace_parameter a4 categorical t65 t66) 3)

    (trace t66 a4 t67)
    (has_parameter a4 integer t66 t67)
    (= (trace_parameter a4 integer t66 t67) 3)
    (has_parameter a4 categorical t66 t67)
    (= (trace_parameter a4 categorical t66 t67) 2)

    (trace t67 a9 t68)
    (has_parameter a9 integer t67 t68)
    (= (trace_parameter a9 integer t67 t68) 4)
    (has_parameter a9 categorical t67 t68)
    (= (trace_parameter a9 categorical t67 t68) 2)

    (trace t68 a2 t69)
    (has_parameter a2 categorical t68 t69)
    (= (trace_parameter a2 categorical t68 t69) 3)
    (has_parameter a2 integer t68 t69)
    (= (trace_parameter a2 integer t68 t69) 10)

    (trace t69 a5 t70)
    (has_parameter a5 categorical t69 t70)
    (= (trace_parameter a5 categorical t69 t70) 3)
    (has_parameter a5 integer t69 t70)
    (= (trace_parameter a5 integer t69 t70) 0)

    (trace t70 a3 t71)
    (has_parameter a3 categorical t70 t71)
    (= (trace_parameter a3 categorical t70 t71) 2)
    (has_parameter a3 integer t70 t71)
    (= (trace_parameter a3 integer t70 t71) 15)

    (trace t71 a7 t72)
    (has_parameter a7 categorical t71 t72)
    (= (trace_parameter a7 categorical t71 t72) 1)
    (has_parameter a7 integer t71 t72)
    (= (trace_parameter a7 integer t71 t72) 35)

    (trace t72 a1 t73)
    (has_parameter a1 categorical t72 t73)
    (= (trace_parameter a1 categorical t72 t73) 2)
    (has_parameter a1 integer t72 t73)
    (= (trace_parameter a1 integer t72 t73) 10)

    (trace t73 a7 t74)
    (has_parameter a7 categorical t73 t74)
    (= (trace_parameter a7 categorical t73 t74) 2)
    (has_parameter a7 integer t73 t74)
    (= (trace_parameter a7 integer t73 t74) 10)

    (trace t74 a5 t75)
    (has_parameter a5 integer t74 t75)
    (= (trace_parameter a5 integer t74 t75) 1)
    (has_parameter a5 categorical t74 t75)
    (= (trace_parameter a5 categorical t74 t75) 2)

    (trace t75 a7 t76)
    (has_parameter a7 integer t75 t76)
    (= (trace_parameter a7 integer t75 t76) 10)
    (has_parameter a7 categorical t75 t76)
    (= (trace_parameter a7 categorical t75 t76) 1)

    (trace t76 a7 t77)
    (has_parameter a7 categorical t76 t77)
    (= (trace_parameter a7 categorical t76 t77) 3)
    (has_parameter a7 integer t76 t77)
    (= (trace_parameter a7 integer t76 t77) 10)

    (trace t77 a7 t78)
    (has_parameter a7 integer t77 t78)
    (= (trace_parameter a7 integer t77 t78) 9)
    (has_parameter a7 categorical t77 t78)
    (= (trace_parameter a7 categorical t77 t78) 3)

    (trace t78 a4 t79)
    (has_parameter a4 categorical t78 t79)
    (= (trace_parameter a4 categorical t78 t79) 3)
    (has_parameter a4 integer t78 t79)
    (= (trace_parameter a4 integer t78 t79) 10)

    (trace t79 a1 t80)
    (has_parameter a1 integer t79 t80)
    (= (trace_parameter a1 integer t79 t80) 10)
    (has_parameter a1 categorical t79 t80)
    (= (trace_parameter a1 categorical t79 t80) 3)

    (trace t80 a10 t81)
    (has_parameter a10 categorical t80 t81)
    (= (trace_parameter a10 categorical t80 t81) 2)
    (has_parameter a10 integer t80 t81)
    (= (trace_parameter a10 integer t80 t81) 10)

    (trace t81 a10 t82)
    (has_parameter a10 integer t81 t82)
    (= (trace_parameter a10 integer t81 t82) 11)
    (has_parameter a10 categorical t81 t82)
    (= (trace_parameter a10 categorical t81 t82) 3)

    (trace t82 a6 t83)
    (has_parameter a6 integer t82 t83)
    (= (trace_parameter a6 integer t82 t83) 10)
    (has_parameter a6 categorical t82 t83)
    (= (trace_parameter a6 categorical t82 t83) 1)

    (trace t83 a1 t84)
    (has_parameter a1 categorical t83 t84)
    (= (trace_parameter a1 categorical t83 t84) 2)
    (has_parameter a1 integer t83 t84)
    (= (trace_parameter a1 integer t83 t84) 10)

    (trace t84 a3 t85)
    (has_parameter a3 categorical t84 t85)
    (= (trace_parameter a3 categorical t84 t85) 1)
    (has_parameter a3 integer t84 t85)
    (= (trace_parameter a3 integer t84 t85) 10)

    (trace t85 a5 t86)
    (has_parameter a5 categorical t85 t86)
    (= (trace_parameter a5 categorical t85 t86) 3)
    (has_parameter a5 integer t85 t86)
    (= (trace_parameter a5 integer t85 t86) 10)

    (trace t86 a1 t87)
    (has_parameter a1 integer t86 t87)
    (= (trace_parameter a1 integer t86 t87) 10)
    (has_parameter a1 categorical t86 t87)
    (= (trace_parameter a1 categorical t86 t87) 3)

    (trace t87 a4 t88)
    (has_parameter a4 integer t87 t88)
    (= (trace_parameter a4 integer t87 t88) 10)
    (has_parameter a4 categorical t87 t88)
    (= (trace_parameter a4 categorical t87 t88) 1)

    (trace t88 a4 t89)
    (has_parameter a4 categorical t88 t89)
    (= (trace_parameter a4 categorical t88 t89) 2)
    (has_parameter a4 integer t88 t89)
    (= (trace_parameter a4 integer t88 t89) 67)

    (trace t89 a10 t90)
    (has_parameter a10 integer t89 t90)
    (= (trace_parameter a10 integer t89 t90) 10)
    (has_parameter a10 categorical t89 t90)
    (= (trace_parameter a10 categorical t89 t90) 3)

    (trace t90 a2 t91)
    (has_parameter a2 categorical t90 t91)
    (= (trace_parameter a2 categorical t90 t91) 2)
    (has_parameter a2 integer t90 t91)
    (= (trace_parameter a2 integer t90 t91) 56)

    (trace t91 a3 t92)
    (has_parameter a3 categorical t91 t92)
    (= (trace_parameter a3 categorical t91 t92) 1)
    (has_parameter a3 integer t91 t92)
    (= (trace_parameter a3 integer t91 t92) 9)

    (trace t92 a9 t93)
    (has_parameter a9 integer t92 t93)
    (= (trace_parameter a9 integer t92 t93) 19)
    (has_parameter a9 categorical t92 t93)
    (= (trace_parameter a9 categorical t92 t93) 1)

    (trace t93 a9 t94)
    (has_parameter a9 categorical t93 t94)
    (= (trace_parameter a9 categorical t93 t94) 2)
    (has_parameter a9 integer t93 t94)
    (= (trace_parameter a9 integer t93 t94) 1)

    (trace t94 a10 t95)
    (has_parameter a10 categorical t94 t95)
    (= (trace_parameter a10 categorical t94 t95) 1)
    (has_parameter a10 integer t94 t95)
    (= (trace_parameter a10 integer t94 t95) 10)

    (trace t95 a5 t96)
    (has_parameter a5 integer t95 t96)
    (= (trace_parameter a5 integer t95 t96) 10)
    (has_parameter a5 categorical t95 t96)
    (= (trace_parameter a5 categorical t95 t96) 2)

    (trace t96 a4 t97)
    (has_parameter a4 categorical t96 t97)
    (= (trace_parameter a4 categorical t96 t97) 2)
    (has_parameter a4 integer t96 t97)
    (= (trace_parameter a4 integer t96 t97) 8)

    (trace t97 a1 t98)
    (has_parameter a1 integer t97 t98)
    (= (trace_parameter a1 integer t97 t98) 10)
    (has_parameter a1 categorical t97 t98)
    (= (trace_parameter a1 categorical t97 t98) 2)

    (trace t98 a7 t99)
    (has_parameter a7 categorical t98 t99)
    (= (trace_parameter a7 categorical t98 t99) 2)
    (has_parameter a7 integer t98 t99)
    (= (trace_parameter a7 integer t98 t99) 66)

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
    (cur_t_state t99)
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

