#lang racket
(define (qsort lst)
  (if (null? lst)
    lst
    (let ([pivot (car lst)])
      (let ([tail (cdr lst)])
        (let ([lsr
               (filter
                (lambda (v) (< v pivot))
                tail)])
	          (let ([grt
	                 (filter
	                  (lambda (v) (>= v pivot))
	                  tail)])
	            (append
	             (qsort lsr)
	             (list pivot)
	             (qsort grt))))))))
	 
(qsort '(9 2 1 8 3))
; '(1 2 3 8 9)