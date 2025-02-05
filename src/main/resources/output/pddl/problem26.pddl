(define (problem prob-trace)
  (:domain trace-alignment)

  (:objects
    t60 t66 t44 t48 t88 t90 t23 t58 t38 t94 t14 t9 t72 t11 t27 t55 t10 t6 t13 t49 t97 t45 t12 t68 t32 t96 t67 t93 t85 t16 t79 t24 t47 t89 t41 t63 t92 t18 t52 t74 t61 t28 t4 t26 t8 t29 t77 t73 t64 t70 t46 t99 t87 t98 t42 t81 t5 t34 t57 t65 t40 t15 t56 t54 t86 t75 t76 t82 t59 t17 t19 t78 t20 t0 t37 t36 t33 t39 t95 t21 t3 t31 t53 t71 t80 t35 t22 t84 t69 t25 t43 t83 t2 t1 t62 t7 t51 t50 t91 t30 - trace_state
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
    (trace t0 a1 t1)
    (has_parameter a1 categorical t0 t1)
    (= (trace_parameter a1 categorical t0 t1) 3)
    (has_parameter a1 integer t0 t1)
    (= (trace_parameter a1 integer t0 t1) 68)

    (trace t1 a2 t2)
    (has_parameter a2 integer t1 t2)
    (= (trace_parameter a2 integer t1 t2) 9)
    (has_parameter a2 categorical t1 t2)
    (= (trace_parameter a2 categorical t1 t2) 2)

    (trace t2 a10 t3)
    (has_parameter a10 categorical t2 t3)
    (= (trace_parameter a10 categorical t2 t3) 2)
    (has_parameter a10 integer t2 t3)
    (= (trace_parameter a10 integer t2 t3) 0)

    (trace t3 a3 t4)
    (has_parameter a3 integer t3 t4)
    (= (trace_parameter a3 integer t3 t4) 10)
    (has_parameter a3 categorical t3 t4)
    (= (trace_parameter a3 categorical t3 t4) 2)

    (trace t4 a2 t5)
    (has_parameter a2 integer t4 t5)
    (= (trace_parameter a2 integer t4 t5) 39)
    (has_parameter a2 categorical t4 t5)
    (= (trace_parameter a2 categorical t4 t5) 2)

    (trace t5 a7 t6)
    (has_parameter a7 categorical t5 t6)
    (= (trace_parameter a7 categorical t5 t6) 2)
    (has_parameter a7 integer t5 t6)
    (= (trace_parameter a7 integer t5 t6) 78)

    (trace t6 a9 t7)
    (has_parameter a9 integer t6 t7)
    (= (trace_parameter a9 integer t6 t7) 14)
    (has_parameter a9 categorical t6 t7)
    (= (trace_parameter a9 categorical t6 t7) 1)

    (trace t7 a9 t8)
    (has_parameter a9 integer t7 t8)
    (= (trace_parameter a9 integer t7 t8) 0)
    (has_parameter a9 categorical t7 t8)
    (= (trace_parameter a9 categorical t7 t8) 3)

    (trace t8 a10 t9)
    (has_parameter a10 integer t8 t9)
    (= (trace_parameter a10 integer t8 t9) 10)
    (has_parameter a10 categorical t8 t9)
    (= (trace_parameter a10 categorical t8 t9) 3)

    (trace t9 a7 t10)
    (has_parameter a7 categorical t9 t10)
    (= (trace_parameter a7 categorical t9 t10) 3)
    (has_parameter a7 integer t9 t10)
    (= (trace_parameter a7 integer t9 t10) 10)

    (trace t10 a3 t11)
    (has_parameter a3 integer t10 t11)
    (= (trace_parameter a3 integer t10 t11) 10)
    (has_parameter a3 categorical t10 t11)
    (= (trace_parameter a3 categorical t10 t11) 1)

    (trace t11 a1 t12)
    (has_parameter a1 categorical t11 t12)
    (= (trace_parameter a1 categorical t11 t12) 3)
    (has_parameter a1 integer t11 t12)
    (= (trace_parameter a1 integer t11 t12) 98)

    (trace t12 a7 t13)
    (has_parameter a7 categorical t12 t13)
    (= (trace_parameter a7 categorical t12 t13) 3)
    (has_parameter a7 integer t12 t13)
    (= (trace_parameter a7 integer t12 t13) 34)

    (trace t13 a1 t14)
    (has_parameter a1 integer t13 t14)
    (= (trace_parameter a1 integer t13 t14) 0)
    (has_parameter a1 categorical t13 t14)
    (= (trace_parameter a1 categorical t13 t14) 2)

    (trace t14 a2 t15)
    (has_parameter a2 categorical t14 t15)
    (= (trace_parameter a2 categorical t14 t15) 1)
    (has_parameter a2 integer t14 t15)
    (= (trace_parameter a2 integer t14 t15) 3)

    (trace t15 a10 t16)
    (has_parameter a10 categorical t15 t16)
    (= (trace_parameter a10 categorical t15 t16) 2)
    (has_parameter a10 integer t15 t16)
    (= (trace_parameter a10 integer t15 t16) 44)

    (trace t16 a4 t17)
    (has_parameter a4 categorical t16 t17)
    (= (trace_parameter a4 categorical t16 t17) 2)
    (has_parameter a4 integer t16 t17)
    (= (trace_parameter a4 integer t16 t17) 1)

    (trace t17 a1 t18)
    (has_parameter a1 categorical t17 t18)
    (= (trace_parameter a1 categorical t17 t18) 3)
    (has_parameter a1 integer t17 t18)
    (= (trace_parameter a1 integer t17 t18) 10)

    (trace t18 a1 t19)
    (has_parameter a1 integer t18 t19)
    (= (trace_parameter a1 integer t18 t19) 10)
    (has_parameter a1 categorical t18 t19)
    (= (trace_parameter a1 categorical t18 t19) 3)

    (trace t19 a1 t20)
    (has_parameter a1 integer t19 t20)
    (= (trace_parameter a1 integer t19 t20) 98)
    (has_parameter a1 categorical t19 t20)
    (= (trace_parameter a1 categorical t19 t20) 1)

    (trace t20 a4 t21)
    (has_parameter a4 integer t20 t21)
    (= (trace_parameter a4 integer t20 t21) 10)
    (has_parameter a4 categorical t20 t21)
    (= (trace_parameter a4 categorical t20 t21) 2)

    (trace t21 a5 t22)
    (has_parameter a5 categorical t21 t22)
    (= (trace_parameter a5 categorical t21 t22) 3)
    (has_parameter a5 integer t21 t22)
    (= (trace_parameter a5 integer t21 t22) 25)

    (trace t22 a2 t23)
    (has_parameter a2 categorical t22 t23)
    (= (trace_parameter a2 categorical t22 t23) 2)
    (has_parameter a2 integer t22 t23)
    (= (trace_parameter a2 integer t22 t23) 9)

    (trace t23 a7 t24)
    (has_parameter a7 categorical t23 t24)
    (= (trace_parameter a7 categorical t23 t24) 1)
    (has_parameter a7 integer t23 t24)
    (= (trace_parameter a7 integer t23 t24) 67)

    (trace t24 a4 t25)
    (has_parameter a4 categorical t24 t25)
    (= (trace_parameter a4 categorical t24 t25) 1)
    (has_parameter a4 integer t24 t25)
    (= (trace_parameter a4 integer t24 t25) 10)

    (trace t25 a9 t26)
    (has_parameter a9 categorical t25 t26)
    (= (trace_parameter a9 categorical t25 t26) 2)
    (has_parameter a9 integer t25 t26)
    (= (trace_parameter a9 integer t25 t26) 42)

    (trace t26 a10 t27)
    (has_parameter a10 categorical t26 t27)
    (= (trace_parameter a10 categorical t26 t27) 2)
    (has_parameter a10 integer t26 t27)
    (= (trace_parameter a10 integer t26 t27) 10)

    (trace t27 a1 t28)
    (has_parameter a1 integer t27 t28)
    (= (trace_parameter a1 integer t27 t28) 1)
    (has_parameter a1 categorical t27 t28)
    (= (trace_parameter a1 categorical t27 t28) 2)

    (trace t28 a6 t29)
    (has_parameter a6 categorical t28 t29)
    (= (trace_parameter a6 categorical t28 t29) 1)
    (has_parameter a6 integer t28 t29)
    (= (trace_parameter a6 integer t28 t29) 10)

    (trace t29 a4 t30)
    (has_parameter a4 categorical t29 t30)
    (= (trace_parameter a4 categorical t29 t30) 2)
    (has_parameter a4 integer t29 t30)
    (= (trace_parameter a4 integer t29 t30) 10)

    (trace t30 a1 t31)
    (has_parameter a1 categorical t30 t31)
    (= (trace_parameter a1 categorical t30 t31) 3)
    (has_parameter a1 integer t30 t31)
    (= (trace_parameter a1 integer t30 t31) 10)

    (trace t31 a10 t32)
    (has_parameter a10 categorical t31 t32)
    (= (trace_parameter a10 categorical t31 t32) 2)
    (has_parameter a10 integer t31 t32)
    (= (trace_parameter a10 integer t31 t32) 100)

    (trace t32 a1 t33)
    (has_parameter a1 categorical t32 t33)
    (= (trace_parameter a1 categorical t32 t33) 1)
    (has_parameter a1 integer t32 t33)
    (= (trace_parameter a1 integer t32 t33) 10)

    (trace t33 a4 t34)
    (has_parameter a4 integer t33 t34)
    (= (trace_parameter a4 integer t33 t34) 22)
    (has_parameter a4 categorical t33 t34)
    (= (trace_parameter a4 categorical t33 t34) 2)

    (trace t34 a10 t35)
    (has_parameter a10 integer t34 t35)
    (= (trace_parameter a10 integer t34 t35) 10)
    (has_parameter a10 categorical t34 t35)
    (= (trace_parameter a10 categorical t34 t35) 2)

    (trace t35 a10 t36)
    (has_parameter a10 categorical t35 t36)
    (= (trace_parameter a10 categorical t35 t36) 2)
    (has_parameter a10 integer t35 t36)
    (= (trace_parameter a10 integer t35 t36) 10)

    (trace t36 a9 t37)
    (has_parameter a9 integer t36 t37)
    (= (trace_parameter a9 integer t36 t37) 10)
    (has_parameter a9 categorical t36 t37)
    (= (trace_parameter a9 categorical t36 t37) 3)

    (trace t37 a2 t38)
    (has_parameter a2 categorical t37 t38)
    (= (trace_parameter a2 categorical t37 t38) 1)
    (has_parameter a2 integer t37 t38)
    (= (trace_parameter a2 integer t37 t38) 9)

    (trace t38 a3 t39)
    (has_parameter a3 categorical t38 t39)
    (= (trace_parameter a3 categorical t38 t39) 1)
    (has_parameter a3 integer t38 t39)
    (= (trace_parameter a3 integer t38 t39) 9)

    (trace t39 a7 t40)
    (has_parameter a7 categorical t39 t40)
    (= (trace_parameter a7 categorical t39 t40) 2)
    (has_parameter a7 integer t39 t40)
    (= (trace_parameter a7 integer t39 t40) 6)

    (trace t40 a10 t41)
    (has_parameter a10 integer t40 t41)
    (= (trace_parameter a10 integer t40 t41) 9)
    (has_parameter a10 categorical t40 t41)
    (= (trace_parameter a10 categorical t40 t41) 2)

    (trace t41 a1 t42)
    (has_parameter a1 categorical t41 t42)
    (= (trace_parameter a1 categorical t41 t42) 1)
    (has_parameter a1 integer t41 t42)
    (= (trace_parameter a1 integer t41 t42) 10)

    (trace t42 a4 t43)
    (has_parameter a4 categorical t42 t43)
    (= (trace_parameter a4 categorical t42 t43) 2)
    (has_parameter a4 integer t42 t43)
    (= (trace_parameter a4 integer t42 t43) 1)

    (trace t43 a4 t44)
    (has_parameter a4 integer t43 t44)
    (= (trace_parameter a4 integer t43 t44) 21)
    (has_parameter a4 categorical t43 t44)
    (= (trace_parameter a4 categorical t43 t44) 2)

    (trace t44 a5 t45)
    (has_parameter a5 categorical t44 t45)
    (= (trace_parameter a5 categorical t44 t45) 2)
    (has_parameter a5 integer t44 t45)
    (= (trace_parameter a5 integer t44 t45) 10)

    (trace t45 a1 t46)
    (has_parameter a1 categorical t45 t46)
    (= (trace_parameter a1 categorical t45 t46) 3)
    (has_parameter a1 integer t45 t46)
    (= (trace_parameter a1 integer t45 t46) 16)

    (trace t46 a5 t47)
    (has_parameter a5 integer t46 t47)
    (= (trace_parameter a5 integer t46 t47) 10)
    (has_parameter a5 categorical t46 t47)
    (= (trace_parameter a5 categorical t46 t47) 1)

    (trace t47 a8 t48)
    (has_parameter a8 categorical t47 t48)
    (= (trace_parameter a8 categorical t47 t48) 3)
    (has_parameter a8 integer t47 t48)
    (= (trace_parameter a8 integer t47 t48) 8)

    (trace t48 a3 t49)
    (has_parameter a3 integer t48 t49)
    (= (trace_parameter a3 integer t48 t49) 10)
    (has_parameter a3 categorical t48 t49)
    (= (trace_parameter a3 categorical t48 t49) 3)

    (trace t49 a1 t50)
    (has_parameter a1 integer t49 t50)
    (= (trace_parameter a1 integer t49 t50) 9)
    (has_parameter a1 categorical t49 t50)
    (= (trace_parameter a1 categorical t49 t50) 3)

    (trace t50 a2 t51)
    (has_parameter a2 categorical t50 t51)
    (= (trace_parameter a2 categorical t50 t51) 1)
    (has_parameter a2 integer t50 t51)
    (= (trace_parameter a2 integer t50 t51) 6)

    (trace t51 a5 t52)
    (has_parameter a5 integer t51 t52)
    (= (trace_parameter a5 integer t51 t52) 10)
    (has_parameter a5 categorical t51 t52)
    (= (trace_parameter a5 categorical t51 t52) 3)

    (trace t52 a8 t53)
    (has_parameter a8 categorical t52 t53)
    (= (trace_parameter a8 categorical t52 t53) 2)
    (has_parameter a8 integer t52 t53)
    (= (trace_parameter a8 integer t52 t53) 10)

    (trace t53 a6 t54)
    (has_parameter a6 categorical t53 t54)
    (= (trace_parameter a6 categorical t53 t54) 1)
    (has_parameter a6 integer t53 t54)
    (= (trace_parameter a6 integer t53 t54) 10)

    (trace t54 a2 t55)
    (has_parameter a2 integer t54 t55)
    (= (trace_parameter a2 integer t54 t55) 16)
    (has_parameter a2 categorical t54 t55)
    (= (trace_parameter a2 categorical t54 t55) 2)

    (trace t55 a3 t56)
    (has_parameter a3 integer t55 t56)
    (= (trace_parameter a3 integer t55 t56) 27)
    (has_parameter a3 categorical t55 t56)
    (= (trace_parameter a3 categorical t55 t56) 3)

    (trace t56 a10 t57)
    (has_parameter a10 categorical t56 t57)
    (= (trace_parameter a10 categorical t56 t57) 3)
    (has_parameter a10 integer t56 t57)
    (= (trace_parameter a10 integer t56 t57) 10)

    (trace t57 a4 t58)
    (has_parameter a4 integer t57 t58)
    (= (trace_parameter a4 integer t57 t58) 9)
    (has_parameter a4 categorical t57 t58)
    (= (trace_parameter a4 categorical t57 t58) 2)

    (trace t58 a1 t59)
    (has_parameter a1 integer t58 t59)
    (= (trace_parameter a1 integer t58 t59) 29)
    (has_parameter a1 categorical t58 t59)
    (= (trace_parameter a1 categorical t58 t59) 3)

    (trace t59 a4 t60)
    (has_parameter a4 categorical t59 t60)
    (= (trace_parameter a4 categorical t59 t60) 1)
    (has_parameter a4 integer t59 t60)
    (= (trace_parameter a4 integer t59 t60) 27)

    (trace t60 a2 t61)
    (has_parameter a2 categorical t60 t61)
    (= (trace_parameter a2 categorical t60 t61) 3)
    (has_parameter a2 integer t60 t61)
    (= (trace_parameter a2 integer t60 t61) 32)

    (trace t61 a1 t62)
    (has_parameter a1 categorical t61 t62)
    (= (trace_parameter a1 categorical t61 t62) 2)
    (has_parameter a1 integer t61 t62)
    (= (trace_parameter a1 integer t61 t62) 10)

    (trace t62 a1 t63)
    (has_parameter a1 categorical t62 t63)
    (= (trace_parameter a1 categorical t62 t63) 3)
    (has_parameter a1 integer t62 t63)
    (= (trace_parameter a1 integer t62 t63) 25)

    (trace t63 a2 t64)
    (has_parameter a2 categorical t63 t64)
    (= (trace_parameter a2 categorical t63 t64) 3)
    (has_parameter a2 integer t63 t64)
    (= (trace_parameter a2 integer t63 t64) 9)

    (trace t64 a6 t65)
    (has_parameter a6 categorical t64 t65)
    (= (trace_parameter a6 categorical t64 t65) 2)
    (has_parameter a6 integer t64 t65)
    (= (trace_parameter a6 integer t64 t65) 8)

    (trace t65 a9 t66)
    (has_parameter a9 categorical t65 t66)
    (= (trace_parameter a9 categorical t65 t66) 2)
    (has_parameter a9 integer t65 t66)
    (= (trace_parameter a9 integer t65 t66) 91)

    (trace t66 a8 t67)
    (has_parameter a8 categorical t66 t67)
    (= (trace_parameter a8 categorical t66 t67) 2)
    (has_parameter a8 integer t66 t67)
    (= (trace_parameter a8 integer t66 t67) 7)

    (trace t67 a1 t68)
    (has_parameter a1 categorical t67 t68)
    (= (trace_parameter a1 categorical t67 t68) 2)
    (has_parameter a1 integer t67 t68)
    (= (trace_parameter a1 integer t67 t68) 41)

    (trace t68 a9 t69)
    (has_parameter a9 categorical t68 t69)
    (= (trace_parameter a9 categorical t68 t69) 2)
    (has_parameter a9 integer t68 t69)
    (= (trace_parameter a9 integer t68 t69) 10)

    (trace t69 a2 t70)
    (has_parameter a2 integer t69 t70)
    (= (trace_parameter a2 integer t69 t70) 1)
    (has_parameter a2 categorical t69 t70)
    (= (trace_parameter a2 categorical t69 t70) 3)

    (trace t70 a1 t71)
    (has_parameter a1 categorical t70 t71)
    (= (trace_parameter a1 categorical t70 t71) 2)
    (has_parameter a1 integer t70 t71)
    (= (trace_parameter a1 integer t70 t71) 10)

    (trace t71 a3 t72)
    (has_parameter a3 integer t71 t72)
    (= (trace_parameter a3 integer t71 t72) 10)
    (has_parameter a3 categorical t71 t72)
    (= (trace_parameter a3 categorical t71 t72) 3)

    (trace t72 a6 t73)
    (has_parameter a6 integer t72 t73)
    (= (trace_parameter a6 integer t72 t73) 10)
    (has_parameter a6 categorical t72 t73)
    (= (trace_parameter a6 categorical t72 t73) 2)

    (trace t73 a3 t74)
    (has_parameter a3 integer t73 t74)
    (= (trace_parameter a3 integer t73 t74) 30)
    (has_parameter a3 categorical t73 t74)
    (= (trace_parameter a3 categorical t73 t74) 2)

    (trace t74 a9 t75)
    (has_parameter a9 integer t74 t75)
    (= (trace_parameter a9 integer t74 t75) 10)
    (has_parameter a9 categorical t74 t75)
    (= (trace_parameter a9 categorical t74 t75) 3)

    (trace t75 a4 t76)
    (has_parameter a4 categorical t75 t76)
    (= (trace_parameter a4 categorical t75 t76) 1)
    (has_parameter a4 integer t75 t76)
    (= (trace_parameter a4 integer t75 t76) 27)

    (trace t76 a1 t77)
    (has_parameter a1 integer t76 t77)
    (= (trace_parameter a1 integer t76 t77) 40)
    (has_parameter a1 categorical t76 t77)
    (= (trace_parameter a1 categorical t76 t77) 3)

    (trace t77 a3 t78)
    (has_parameter a3 categorical t77 t78)
    (= (trace_parameter a3 categorical t77 t78) 1)
    (has_parameter a3 integer t77 t78)
    (= (trace_parameter a3 integer t77 t78) 9)

    (trace t78 a8 t79)
    (has_parameter a8 integer t78 t79)
    (= (trace_parameter a8 integer t78 t79) 92)
    (has_parameter a8 categorical t78 t79)
    (= (trace_parameter a8 categorical t78 t79) 3)

    (trace t79 a3 t80)
    (has_parameter a3 categorical t79 t80)
    (= (trace_parameter a3 categorical t79 t80) 3)
    (has_parameter a3 integer t79 t80)
    (= (trace_parameter a3 integer t79 t80) 59)

    (trace t80 a10 t81)
    (has_parameter a10 integer t80 t81)
    (= (trace_parameter a10 integer t80 t81) 93)
    (has_parameter a10 categorical t80 t81)
    (= (trace_parameter a10 categorical t80 t81) 3)

    (trace t81 a2 t82)
    (has_parameter a2 categorical t81 t82)
    (= (trace_parameter a2 categorical t81 t82) 3)
    (has_parameter a2 integer t81 t82)
    (= (trace_parameter a2 integer t81 t82) 9)

    (trace t82 a8 t83)
    (has_parameter a8 integer t82 t83)
    (= (trace_parameter a8 integer t82 t83) 10)
    (has_parameter a8 categorical t82 t83)
    (= (trace_parameter a8 categorical t82 t83) 3)

    (trace t83 a7 t84)
    (has_parameter a7 categorical t83 t84)
    (= (trace_parameter a7 categorical t83 t84) 2)
    (has_parameter a7 integer t83 t84)
    (= (trace_parameter a7 integer t83 t84) 2)

    (trace t84 a5 t85)
    (has_parameter a5 integer t84 t85)
    (= (trace_parameter a5 integer t84 t85) 42)
    (has_parameter a5 categorical t84 t85)
    (= (trace_parameter a5 categorical t84 t85) 3)

    (trace t85 a1 t86)
    (has_parameter a1 categorical t85 t86)
    (= (trace_parameter a1 categorical t85 t86) 2)
    (has_parameter a1 integer t85 t86)
    (= (trace_parameter a1 integer t85 t86) 71)

    (trace t86 a4 t87)
    (has_parameter a4 integer t86 t87)
    (= (trace_parameter a4 integer t86 t87) 90)
    (has_parameter a4 categorical t86 t87)
    (= (trace_parameter a4 categorical t86 t87) 2)

    (trace t87 a8 t88)
    (has_parameter a8 categorical t87 t88)
    (= (trace_parameter a8 categorical t87 t88) 3)
    (has_parameter a8 integer t87 t88)
    (= (trace_parameter a8 integer t87 t88) 33)

    (trace t88 a2 t89)
    (has_parameter a2 categorical t88 t89)
    (= (trace_parameter a2 categorical t88 t89) 3)
    (has_parameter a2 integer t88 t89)
    (= (trace_parameter a2 integer t88 t89) 71)

    (trace t89 a3 t90)
    (has_parameter a3 categorical t89 t90)
    (= (trace_parameter a3 categorical t89 t90) 2)
    (has_parameter a3 integer t89 t90)
    (= (trace_parameter a3 integer t89 t90) 15)

    (trace t90 a5 t91)
    (has_parameter a5 categorical t90 t91)
    (= (trace_parameter a5 categorical t90 t91) 2)
    (has_parameter a5 integer t90 t91)
    (= (trace_parameter a5 integer t90 t91) 99)

    (trace t91 a5 t92)
    (has_parameter a5 integer t91 t92)
    (= (trace_parameter a5 integer t91 t92) 73)
    (has_parameter a5 categorical t91 t92)
    (= (trace_parameter a5 categorical t91 t92) 3)

    (trace t92 a3 t93)
    (has_parameter a3 categorical t92 t93)
    (= (trace_parameter a3 categorical t92 t93) 1)
    (has_parameter a3 integer t92 t93)
    (= (trace_parameter a3 integer t92 t93) 10)

    (trace t93 a9 t94)
    (has_parameter a9 integer t93 t94)
    (= (trace_parameter a9 integer t93 t94) 0)
    (has_parameter a9 categorical t93 t94)
    (= (trace_parameter a9 categorical t93 t94) 2)

    (trace t94 a2 t95)
    (has_parameter a2 categorical t94 t95)
    (= (trace_parameter a2 categorical t94 t95) 2)
    (has_parameter a2 integer t94 t95)
    (= (trace_parameter a2 integer t94 t95) 9)

    (trace t95 a6 t96)
    (has_parameter a6 integer t95 t96)
    (= (trace_parameter a6 integer t95 t96) 60)
    (has_parameter a6 categorical t95 t96)
    (= (trace_parameter a6 categorical t95 t96) 1)

    (trace t96 a7 t97)
    (has_parameter a7 integer t96 t97)
    (= (trace_parameter a7 integer t96 t97) 41)
    (has_parameter a7 categorical t96 t97)
    (= (trace_parameter a7 categorical t96 t97) 3)

    (trace t97 a7 t98)
    (has_parameter a7 categorical t97 t98)
    (= (trace_parameter a7 categorical t97 t98) 2)
    (has_parameter a7 integer t97 t98)
    (= (trace_parameter a7 integer t97 t98) 69)

    (trace t98 a4 t99)
    (has_parameter a4 integer t98 t99)
    (= (trace_parameter a4 integer t98 t99) 99)
    (has_parameter a4 categorical t98 t99)
    (= (trace_parameter a4 categorical t98 t99) 2)

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

