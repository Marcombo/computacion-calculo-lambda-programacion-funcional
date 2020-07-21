#lang racket
(define table
  (make-immutable-hash '([("a" "b" "c") . "d"]
                         [1 . 2])))
(define table-2 (hash-set table "programación" "funcional"))
table-2
; '#hash((1 . 2) ("programación" . "funcional") (("a" "b" "c") . "d"))
table
; '#hash((1 . 2) (("a" "b" "c") . "d"))
