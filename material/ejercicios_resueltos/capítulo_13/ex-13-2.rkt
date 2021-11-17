#lang racket

(define (pair-reverse pair)
  (cons (cdr pair) (car pair)))

(define x (cons 1 2))

x
;; '(1 . 2)

(pair-reverse x)
;; '(2 . 1)
