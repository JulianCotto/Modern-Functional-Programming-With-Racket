#lang racket
(require racket/trace)

(define (powerSeries ctrl) ; define powerSeries function with ctrl parameter
  (if (<= ctrl 0) ; if ctrl parameter <= 0
      0 ; return 0 when function reaches base case
      (+ (expt (/ 1 3) (- ctrl 1)) (powerSeries (- ctrl 1)))))
; calculate^ powerSeries and call powerSeries^ recursively with decremented ctrl variable

"====================================="
"Power Series Execution 1 (raw results"
"====================================="
;(trace powerSeries)
(powerSeries 20)
(newline)
"========================================="
"Power Series Execution 2 (exact->inexact)"
"========================================="
(exact->inexact (powerSeries 20))
;(untrace powerSeries)
