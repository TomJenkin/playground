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

; tracing example...

(define (trace-wrapper f)
  (lambda args
    (display "Calling: ") (display f) (display " with args ") (display args) (newline)
    (let ((result (apply f args)))
      (display "Result: ") (display result) (newline)
      result)))

(define (square x)
  (* x x))

;; Manually wrap `square` in trace
(define square-traced (trace-wrapper square))

;; Call the traced function
(square-traced 5)

(define (fn1 x) (+ x 3))

(fn1 33)

(car '(10 20 30))  ; => 10
(cdr '(10 20 30))  ; => (20 30)
(cons 5 '(10 20))  ; => (5 10 20)

;(print-ast '(+ 1 (* 2 3)))

;(print-ast '(factorial 33))

;(print-ast factorial)

(print-ast '(+ 2 3))
