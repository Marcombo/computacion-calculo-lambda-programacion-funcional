#lang racket
(filter (lambda (n)
    (if (> n 0) #t #f)) '(-1 2 -3 4 -5))
; '(2 4)
