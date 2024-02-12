;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Developer: Julian Cotto
; Date: 1/23/2024
; File: PLWeek02_JulianCotto.rkt
; Purpose: Variables, Functions, Conditionals and Operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#lang racket

(define (calculate x) ; define + function + parameter
  (- (+ 30 (* 2 x))(* 3 (sqr x)))) ; {1: 2x^2, 2: x^2, 3: 3x^2, 4: 30 + (currRes), 5: Subtract (currRes from remaining elements)}

(calculate 3) ; call calculate with parameter 3

(define (calculateV2 x) ;define + functionV2 + parameter
  (let ((res (- (+ 30 (* 2 x))(* 3 (sqr x))))) ; same function definition
    (if (> res 10) ; if structure
        (format "Result: ~a" res) ; response using format to concatenate string to variable
        (if (< res -10) ; additional checks
            (format "Response: ~a" res) ; additional checks response
            (format "Answer: ~a" res))))) ; else response

(calculateV2 2) ; call calculateV2 with parameter 2 to demonstrate initial if-statement response
(calculateV2 3) ; call calculateV2 with parameter 3 to demonstrate else portion of if-statement response
(calculateV2 5) ; call calculateV2 with parameter 4 to demonstrate additional checks portion of is-statement response
