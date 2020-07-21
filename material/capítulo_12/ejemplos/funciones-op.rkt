#lang racket
(define op
  (lambda (f a b) (f a b)))
	
(displayln (op * 1 2))
; 2
