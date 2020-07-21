#lang racket
(define lst '(1 2 3))
(append lst '(4 5))
; '(1 2 3 4 5)
(append '(4 5) lst)
; '(4 5 1 2 3)
