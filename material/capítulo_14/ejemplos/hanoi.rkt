#lang racket
(require racket/block) 
(define (hanoi n source dest aux)
  (if (= n 1)
      (displayln
       (list "Mover disco 1 desde origen" source
             "al destino" dest))
      (block
       (hanoi (- n 1) source aux dest)
       (displayln
        (list "Mover disco" n
              "desde origen" source
              "al destino" dest))
       (hanoi (- n 1) aux dest source))))
		 
(hanoi 3 "A" "C" "B")
; (Mover disco 1 desde origen A al destino C)
; (Mover disco 2 desde origen A al destino B)
; (Mover disco 1 desde origen C al destino B)
; (Mover disco 3 desde origen A al destino C)
; (Mover disco 1 desde origen B al destino A)
; (Mover disco 2 desde origen B al destino C)
; (Mover disco 1 desde origen A al destino C)
