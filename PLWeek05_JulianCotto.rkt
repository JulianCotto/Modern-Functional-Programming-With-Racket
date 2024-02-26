#lang racket
(require racket/trace) ; import racket trace module

(define (myPolynomial x) ; define the first polynomial
  (- (- (* 9 (* x x)) (* 3 x)) 25))

(define (myOtherPolynomial x) ; define the second polynomial
  (- (- (* 11 (* x x)) (* 2 x)) 50))

(define (root-iter infunc x0 accuracy) ; define the root-iter function
  (let* ([fx (infunc x0)]
         [fxplusfx (infunc (+ x0 fx))]
         [A (- (/ fxplusfx fx) 1.0)]
         [x1 (- x0 (/ fx A))]
         [fx1 (infunc x1)])
    (if (< (abs fx1) accuracy)
        (printf "Final x: ~a, Final y: ~a~n" x1 fx1)
        (root-iter infunc x1 accuracy))))

; uncomment the below line to troubleshoot
; (trace root-iter)
"=================================================="
"Recursive Steffensen's Method for first Polynomial"
"=================================================="
; call the root-iter function with the first polynomial
(root-iter myPolynomial 4.0 0.00001)


"==================================================="
"Recursive Steffensen's Method for second Polynomial"
"==================================================="
; Call the root-iter function with the second polynomial
(root-iter myOtherPolynomial 1.0 0.00001)

; uncomment the below line to troubleshoot
; (untrace root-iter)
