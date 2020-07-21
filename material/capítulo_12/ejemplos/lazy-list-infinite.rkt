#lang lazy ;package
(define list-infinite
  (lambda (n) (cons n (list-infinite (+ n 1)))))
	 
(list-infinite 1)
; (1 . #<promise>)
(first (list-infinite 1))
; 1
(first (cdr (list-infinite 1)))
; 2
(first (cdr (cdr (list-infinite 1))))
; 3
