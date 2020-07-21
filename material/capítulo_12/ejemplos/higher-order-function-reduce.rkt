#lang racket
(define (reduce func lst)
    (if (null? (cdr lst))
        (car lst) ;expr-true
        (func (car lst) (reduce func (cdr lst))) ;expr-false
))
(reduce + '(1 2 3 4 5))
; 15
