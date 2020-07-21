#lang racket

(struct cap13
    (list hash pair structure-type tree) #:transparent)
(define cap
    (cap13 '(1 2 3) '#([1 . 2]) (cons 1 2) null null))

(cap13-list cap)
; '(1 2 3)
(cap13-pair cap)
; '(1 . 2)
(cap13-tree cap)
; '()
