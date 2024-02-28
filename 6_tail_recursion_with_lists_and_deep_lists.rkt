#lang racket
(require racket/trace)

(define (listLength lst sofar)
  (if (null? lst) ; If the list is empty,
      sofar ; return sofar, which holds the count of items.
      (listLength (cdr lst) (+ sofar 1)))) ; Else, recursively call listLength with the rest of the list and increment sofar.

(define (deepListLength lst sofar)
  (cond ((null? lst) sofar) ; If the list is empty, return sofar, which holds the count of atoms.
        ((not (pair? (car lst))) (deepListLength (cdr lst) (+ sofar 1))) ; If the first element of the list is not a list (i.e., it's an atom), recursively call deepListLength with the rest of the list and increment sofar.
        (else (deepListLength (append (cdr lst) (car lst)) sofar)))) ; Else (the first element is a list), recursively call deepListLength with the rest of the list appended to the first element, and sofar.

(define list '(1 2 3 4))
(define list1 '(1 (2 3) (4 (5 6))))
(define sofar 0)

"======================================="
"List Length Method using Tail Recursion"
"======================================="
(trace listLength)
(listLength list sofar)
(listLength list1 sofar) 
(untrace listLength)

"============================================"
"Deep List Length Method using Tail Recursion"
"============================================"
(trace deepListLength)
(deepListLength list sofar)
(deepListLength list1 sofar)
(untrace deepListLength)
