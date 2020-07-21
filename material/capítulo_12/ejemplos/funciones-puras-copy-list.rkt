#lang racket
(define copy-list
  (lambda (lst)
    (cond
      [(null? lst) '()]
      [(list? lst)
       (cons (copy-list (car lst)) (copy-list (cdr lst)))
       lst]
      )))
(equal? '(1 2 3) (copy-list '(1 2 3)))
; #t
