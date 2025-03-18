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

(display (+ 4 2))