#lang racket
(require racket/trace)

(define (sign i)
  (if (even? i) 1 -1))

(define (power-series n [i 0])
  (if (> i 20)
      0
      (+ (* (sign i) (/ 1.0 (expt n i)))
         (power-series n (+ i 1)))))

(define (power-series-lambda n [i 0])
  (if (> i 20)
      0
      (+ (* ((lambda (i) (if (even? i) 1 -1)) i) (/ 1.0 (expt n i)))
         (power-series-lambda n (+ i 1)))))

"============================================="
"Power Series Execution w/ named sign function"
"============================================="
;(trace power-series)
(displayln (exact->inexact (power-series 3)))  ; Output: ~0.7500000000716995
(displayln (exact->inexact (power-series 4)))  ; Output: ~0.8000000000001819
;(untrace power-series)

"=============================================="
"Power Series Execution w/ lambda sign function"
"=============================================="
;(trace power-series-lambda)
(displayln (exact->inexact (power-series-lambda 3)))  ; Output: ~0.7500000000716995
(displayln (exact->inexact (power-series-lambda 4)))  ; Output: ~0.8000000000001819
;(untrace power-series-lambda)
