#lang racket
(define par (cons 1 2))
(pair? par)
; #t
(define empty '())
(pair? empty)
; #f
