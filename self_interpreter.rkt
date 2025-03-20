#lang r5rs

(define eval
  (lambda (expr env)
    (display "Evaluating: ") (display expr) (newline)
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
       (my-apply (eval (car expr) env)
                 (map (lambda (e) (eval e env)) (cdr expr)))))))

(define my-apply
  (lambda (proc args)
    (cond
      ((primitive-procedure? proc) (apply-primitive proc args))
      ((eq? (car proc) 'closure)
       (eval (caddr proc) (extend-env (cadr proc) args (cadddr proc))))
      (else
       (display "Unknown procedure type: ") (display proc) (newline)
       #f)))) 

(define lookup
  (lambda (var env)
    (cond
      ((assoc var env) => cdr)
      ((assoc var global-env) => cdr)
      (else 
       (display "Unbound variable: ") (display var) (newline)
       #f))))

(define extend-env
  (lambda (params args env)
    (append (map cons params args) env)))

(define primitive-procedure?
  (lambda (proc)
    (procedure? proc)))

(define apply-primitive
  (lambda (proc args)
    (apply proc args))) ;; This uses Scheme's built-in `apply`

(define global-env '())

(define set-global!
  (lambda (expr env)
    (let ((var (cadr expr))
          (val (eval (caddr expr) env)))
      (set! global-env (cons (cons var val) global-env)))))

;; Initialize global environment
(set! global-env
  (list (cons '+ +)
        (cons '- -)
        (cons '* *)
        (cons '/ /)
        (cons '< <)
        (cons '> >)
        (cons '= =)
        (cons 'display display)))

;; Test Cases
(eval '(define square (lambda (x) (* x x))) global-env)
(display (eval '(square 5) global-env)) ;; Should print 25
(newline)
