#lang racket
(equal? '(1 2 3 4 5) (list 1 2 3 4 5))
; true
	 
(car '(1 2 3 4 5))
; 1
	 
(cdr '(1 2 3 4 5))
; '(2 3 4 5)
	 
(last '(1 2 3 4 5))
; 5
	 
(cons (car '(1 2 3 4 5)) (cdr '(1 2 3 4 5)))
; '(1 2 3 4 5)
