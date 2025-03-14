#lang r5rs

(#%require "tools.rkt" "temp.rkt")

;(define my-list (range 1 1000))

(define nn 10)
(print (factorial-tail nn))
(print (factorial nn))
(print (double-list x))
(print hello-world)
;(take my-list 12)
;(display (take '(3 3 3 3) 2))

(define my-list '(1 2 3 4 5 6 7 8 9))
(print (car my-list))
(print (cdr my-list))

(print (list-head my-list 3))

(print (+ 44 55))

;(newline)



