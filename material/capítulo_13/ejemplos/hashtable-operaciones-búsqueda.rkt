#lang racket
(define table
  (make-immutable-hash '([("a" "b" "c") . "d"]
                         [1 . 2])))

(hash-ref table '("a" "b" "c"))
; "d"
(hash-ref table 1)
; 2
