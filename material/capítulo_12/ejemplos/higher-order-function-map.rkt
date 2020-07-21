#lang racket
(map (lambda (n)
       (list n (+ n 1))) '(1 2 3))
; '((1 2) (2 3) (3 4)) 
