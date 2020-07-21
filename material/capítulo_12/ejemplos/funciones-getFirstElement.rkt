#lang racket
(define getFirstElement
  (lambda (a b)
    (define first (lambda (x y) x))
    (first a b)))
 
(displayln (getFirstElement 1 2))
; 1	
