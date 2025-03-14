#lang r5rs

(#%provide (all-defined))

(define x '(1 2 3 4 5 6 7 8 9 10))

(define (double-list lst)
  (map (lambda (x) (* x 2)) lst))
