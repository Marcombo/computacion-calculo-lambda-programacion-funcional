#lang racket
(define increment
  (lambda (n)
    (+ n 1)))
(map increment '(1 2 3))
; '(2 3 4)
