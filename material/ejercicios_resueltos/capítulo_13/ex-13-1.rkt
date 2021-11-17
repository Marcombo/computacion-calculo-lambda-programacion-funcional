#lang racket

(define table (make-immutable-hash '(["cálculo" . "lambda"]
                                     ["máquina" . "turing"])))

table
;; '#hash(("cálculo" . "lambda") ("máquina" . "turing"))

;;; La función hash-set ya actualiza el valor de una clave concreta si
;;; existe en el hash. Nos basta con coprobar que la clave existe, ya
;;; que, de otro modo, la creará. En ese caso, se lanza una excepción.
(define (hash-reset hash key new-val)
  (unless (hash-has-key? hash key)
    (error "no value found for key: " key))
  (hash-set hash key new-val))

(hash-reset table "cálculo" "LAMBDA")
;; '#hash(("cálculo" . "LAMBDA") ("máquina" . "turing"))

(hash-reset table "máquina" "de Turing")
;; '#hash(("cálculo" . "lambda") ("máquina" . "de Turing"))

(hash-reset (hash-reset table "cálculo" "LAMBDA") "máquina" "A Machine")
;; '#hash(("cálculo" . "LAMBDA") ("máquina" . "A Machine"))
