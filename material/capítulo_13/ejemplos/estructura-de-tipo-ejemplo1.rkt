#lang racket
(struct cap13
    (list hash pair structure-type tree) #:transparent)
(define cap
    (cap13 '(1 2 3) '#([1 . 2]) (cons 1 2) null null))
(displayln cap)
; #(struct:cap13 (1 2 3) #((1 . 2)) (1 . 2) () ())
