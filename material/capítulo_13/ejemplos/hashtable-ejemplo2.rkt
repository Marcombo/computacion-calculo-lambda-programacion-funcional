#lang racket
(define table
  (make-immutable-hash '([("a" "b" "c") . "d"]
                         [1 . 2])))
