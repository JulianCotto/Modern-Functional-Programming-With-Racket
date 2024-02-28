#lang racket
(require racket/trace)

; The middleOfThree function takes a list and returns the middle value of the first three elements
(define (middleOfThree lst)
  (let* ([first (if (null? lst) null (car lst))] ; Get the first element of the list, or null if the list is empty
         [second (if (null? lst) first (if (null? (cdr lst)) first (car (cdr lst))))] ; Get the second element of the list, or the first element if the list has less than two elements
         [third (if (or (null? lst) (null? (cdr lst))) second (if (null? (cdr (cdr lst))) second (car (cdr (cdr lst)))))] ) ; Get the third element of the list, or the second element if the list has less than three elements
    (cond
      [(and (<= first second) (<= second third)) second] ; If the second element is the middle value, return it
      [(and (<= second first) (<= first third)) first] ; If the first element is the middle value, return it
      [else third]))) ; Otherwise, return the third element

; The myQuicksort function takes a list and returns a sorted version of the list
(define (myQuicksort lst)
  (if (null? lst) ; If the list is empty, return an empty list
      '()
      (let* ([pivot (middleOfThree lst)] ; Get the pivot value using the middleOfThree function
             [less (filter (lambda (x) (< x pivot)) lst)] ; Get a list of all elements less than the pivot
             [equal (filter (lambda (x) (= x pivot)) lst)] ; Get a list of all elements equal to the pivot
             [greater (filter (lambda (x) (> x pivot)) lst)]) ; Get a list of all elements greater than the pivot
        (append (myQuicksort less) equal (myQuicksort greater))))) ; Recursively sort the less and greater lists, and append them with the equal list

; Define a list to be sorted
(define lst '( 20 13 74 5 12 9 22 94 22 6 96 72 3 53 33 21 101 3 17 15 95 88))

; Define lists to check behavior of functions on lists with less than 3 distinct numbers at the beginning of the list
(define lst1 '(2 2 5 3 4))
(define lst2 '(4 2))
(define lst3 '(5))



"================================================================================"
"Recursive Quicksort Implementation with Pivot Number Determined by middleOfThree"
"================================================================================"
; uncomment the next two lines to troublshoot
;(trace myQuicksort)
;(trace middleOfThree)
(define outputList (myQuicksort lst)) ; call the recursive myQuicksort function with lst and assign to outputList
(printf "Input List: ~a\n" lst) ; print the input list
(printf "Output List: ~a\n" outputList) ; print the output list
; uncomment the next two lines to troublshoot
;(untrace middleOfThree)
;(untrace myQuicksort)
(newline) ; print a newline for readability
"=============================================================================="
"Check Quicksort Behavior On Lists That Don't Start With Three Distinct Numbers"
"=============================================================================="
; uncomment the next two lines to troublshoot
;(trace myQuicksort)
;(trace middleOfThree)
(define outputList1 (myQuicksort lst1)) ; call the recursive myQuicksort function with lst1 and assign to outputList1
(define outputList2 (myQuicksort lst2)) ; call the recursive myQuicksort function with lst2 and assign to outputList2
(define outputList3 (myQuicksort lst3)) ; call the recursive myQuicksort function with lst3 and assign to outputList3
(printf "Input List1: ~a\n" lst1) ; print the input list
(printf "Output List1: ~a\n" outputList1) ; print the output list
(newline) ; print a newline for readability
(printf "Input List2: ~a\n" lst2) ; print the input list
(printf "Output List2: ~a\n" outputList2) ; print the output list
(newline) ; print a newline for readability
(printf "Input List3: ~a\n" lst3) ; print the input list
(printf "Output List3: ~a\n" outputList3) ; print the output list
; uncomment the next two lines to troublshoot
;(untrace middleOfThree)
;(untrace myQuicksort)
