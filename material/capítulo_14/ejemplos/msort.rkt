#lang racket
(define (merge-list left right)
  (if (or (null? left) (null? right))
      (append left right)
      (let ([fa (car left)])
        (let ([fb (car right)])
          (if (< fa fb)
              (append
               (list fa)
               (merge-list (cdr left) right))
              (append
               (list fb)
               (merge-list left (cdr right)))
              )))))
	 
(define (msort lst)
  (if (<= (length lst) 1)
      lst
      (let ([middle
             (round (/ (length lst) 2))])
        (let ([left (take lst middle)])
          (let ([right
                 (take-right lst
                             (- (length lst) middle))])
            (merge-list
             (msort left)
             (msort right))
            )))))
	 
(msort  '(9 2 1 8 3))
; '(1 2 3 8 9)
