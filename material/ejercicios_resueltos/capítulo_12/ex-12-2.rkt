#lang racket

(define (third-a? tuple)
  (match tuple
	 [(list _ _ "a" _) #t]
	 [else #f]))

(third-a? '(1 2 "a" 3))
