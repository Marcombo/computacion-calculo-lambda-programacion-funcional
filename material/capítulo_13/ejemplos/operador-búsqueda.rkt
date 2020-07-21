#lang racket
(define lst '(1 2 3 4 5))
	
(member 3 lst)
; '(3 4 5)
	
(member 10 lst)
; #f

(findf (lambda (elem)
         (= elem 3)) lst)
; 3
	 
(findf (lambda (elem)
         (= elem 100)) lst)
; #f
