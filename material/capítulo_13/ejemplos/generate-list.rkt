#lang racket
(define generate-list
  (lambda (init elem limit)
    (cond
      [(= init limit) '()]
      [else (cons elem (generate-list (+ init 1) elem limit))]
      )))
(generate-list 0 '(1 2) 5)
; '((1 2) (1 2) (1 2) (1 2) (1 2))
