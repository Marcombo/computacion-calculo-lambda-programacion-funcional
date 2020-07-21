#lang racket
(define reverse-list
  (lambda (lst)
    (cond
      [(null? lst) '()]
      [else (cons (last lst)
                  (reverse-list
                   (drop-right lst 1)))])))
	 
(reverse-list '(1 2 3 4 5))
; '(5 4 3 2 1)
