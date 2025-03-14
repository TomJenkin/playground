#lang r5rs

(#%provide (all-defined))

(define hello-world "hello world!")

(define (print x) (display x) (newline)) ; print with newline

(define (range start end)
  (if (> start end)
      '()  ; Base case: return an empty list
      (cons start (range (+ start 1) end))))

(define (factorial-tail n) 
  (define (fact-helper n acc)
    (if (= n 0)
        acc
        (fact-helper (- n 1) (* n acc))))
  (fact-helper n 1))

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))
