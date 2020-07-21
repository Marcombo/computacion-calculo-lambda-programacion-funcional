#lang racket
(define table
  (make-immutable-hash '([("a" "b" "c") . "d"]
                         [1 . 2])))

(define table-2 (hash-set table "programación" "funcional"))

(define table-3 (hash-remove table-2 '("a" "b" "c")))
table-3
;'#hash((1 . 2) (("a" "b" "c") . "d"))

(equal? table-2 table-3)
