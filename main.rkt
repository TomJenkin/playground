#lang r5rs

(#%require "tools.rkt" "temp.rkt")

(define my-list (range 1 50))
(define nn 10)
(print (factorial-tail nn))
(print (factorial nn))
(print (double-list x))
(print hello-world)
(print (car my-list))
(print (cdr my-list))

(define (self-referential)
  (define program-length (string-length "(define (self-referential)... )"))
  (display "I am a program of length: ")
  (display program-length)
  (newline))

(self-referential)

;(define (liar) (not (liar)))
;(display (liar)) ;; Causes infinite recursion

(define (self-reference stmt)
  (string-append "The following statement is false: " stmt))

(define paradox (self-reference "This statement is false."))

(display paradox) ;; Output: The following statement is false: This statement is false.
(newline)

(display (string-append "hello" " there"))
(newline)

(define (describe-number n)
  (case n
    ((1) "One")
    ((2 3 4) "Small number")
    ((5 6 7 8 9 10) "Medium number")
    (else "Large number")))

;; Example usage
(display (describe-number 2))  ;; Output: "Small number"
(newline)
(display (describe-number 7))  ;; Output: "Medium number"
(newline)
(display (describe-number 15)) ;; Output: "Large number"
(newline)

(define (match-string s)
  (case s
    ("hello" 1) 
    ("fred" 2)
    (else 3)))

(display (match-string "fred"))
(newline)
