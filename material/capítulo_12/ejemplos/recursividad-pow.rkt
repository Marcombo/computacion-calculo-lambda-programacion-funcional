#lang racket
(define pow
  (lambda (n e)
    (cond
      [(= e 0) 1]
      [(= e 1) n]
      [else (* (pow n (- e 1)) n)])))
	 
(displayln (pow 2 4))
; 16
