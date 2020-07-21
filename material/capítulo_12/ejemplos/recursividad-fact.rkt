#lang racket
(define fact
  (lambda (n)
    (cond
      [(<= n 0) 0]
      [(= n 1) 1]
      [else (* (fact (- n 1)) n)])))
	 
(displayln (fact 7))
; 5040
