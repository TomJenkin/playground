#lang r5rs

(define eval
  (lambda (expr env)
    (cond
      ((symbol? expr) (lookup expr env))
      ((not (pair? expr)) expr)
      ((eq? (car expr) 'quote) (cadr expr))
      ((eq? (car expr) 'if)
       (if (eval (cadr expr) env)
           (eval (caddr expr) env)
           (eval (cadddr expr) env)))
      ((eq? (car expr) 'lambda)
       (list 'closure (cadr expr) (caddr expr) env))
      ((eq? (car expr) 'define)
       (begin
         (set-global! expr env)
         'ok))
      (else
       (apply (eval (car expr) env)
              (map (lambda (e) (eval e env)) (cdr expr)))))))

(define apply
  (lambda (proc args)
    (cond
      ((primitive-procedure? proc) (apply-primitive proc args))
      ((eq? (car proc) 'closure)
       (eval (caddr proc) (extend-env (cadr proc) args (cadddr proc))))
      (else
       (display "Unknown procedure type: ") (display proc) (newline)
       #f)))) ;; Returns #f instead of error

(define lookup
  (lambda (var env)
    (cond
      ((null? env)
       (display "Unbound variable: ") (display var) (newline)
       #f)  ;; Returns #f instead of throwing an error
      ((eq? var (caar env)) (cdar env))
      (else (lookup var (cdr env))))))

(define extend-env
  (lambda (params args env)
    (append (map cons params args) env)))

(define primitive-procedure?
  (lambda (proc)
    (procedure? proc)))

(define apply-primitive
  (lambda (proc args)
    (apply proc args)))

;; Global environment (now mutable)
(define global-env '())

(define set-global!
  (lambda (expr env)
    (set! global-env (cons (cons (cadr expr) (eval (caddr expr) env)) global-env))))

;; Initialize global environment with primitive operations
(set! global-env
  (list (cons '+ +)
        (cons '- -)
        (cons '* *)
        (cons '/ /)
        (cons '< <)
        (cons '> >)
        (cons '= =)
        (cons 'display display)))

;; Example usage
(eval '(define square (lambda (x) (* x x))) global-env)
(display (eval '(square 5) global-env)) ;; Should print 25
(newline)
