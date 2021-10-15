#lang racket
(define copy-list
  (lambda (lst)
    (cond [(null? lst) '()]
	  [(list? lst) (cons (car lst)
			     (copy-list (cdr lst)))])))
(equal? '(1 2 3) (copy-list '(1 2 3)))
; #t
(eq? '(1 2 3) (copy-list '(1 2 3)))
; #f
