#lang racket

;; Un Heap min o montículo mínimo es una estructura de árbol binario
;; en la que cada nodo, menos el último, tiene dos hijos, y cada uno
;; de ellos es mayor al padre. Se rellena de izquierda a derecha

;;; Estructura de datos

(define (just v)
  `(,v))

(define nothing null)

(define just? (compose not null?))

(define nothing? null?)

(define from-just car)

(define (heap-insert-last hp el)
  (apply vector
         (append (vector->list hp) `(,el))))

(define (parent-index i)
  (quotient (- i 1) 2))

(define (node-value hp i)
  (if (and (>= i 0) (< i (vector-length hp)))
      (just (vector-ref hp i))
      nothing))

(define (parent-node hp i)
  (if (= i 0)
      nothing
      (node-value hp (parent-index i))))

(define (left-child-index i)
  (+ (* 2 i) 1))

(define (left-child-node hp i)
  (node-value hp (left-child-index i)))

(define (right-child-index i)
  (+ (* 2 i) 2))

(define (swap hp src-i dest-i)
  (let ([src-val (node-value hp src-i)]
        [dest-val (node-value hp dest-i)])
    (vector-set! hp dest-i (from-just src-val))
    (vector-set! hp src-i (from-just dest-val))
    hp))

(define (float hp i)
  (let ([node (node-value hp i)]
        [parent (parent-node hp i)]
        [parent-i (parent-index i)])
    (if (and (just? parent) (just? node) (< (from-just node) (from-just parent)))
        (float (swap hp i parent-i) parent-i)
        hp)))

(define (heap-insert hp el)
  (let ([unfloated-hp (heap-insert-last hp el)]
        [index (vector-length hp)])
    (float unfloated-hp index)))

(heap-insert (vector 1 3 6 5 9) 2)
;; '#(1 3 2 5 9 6)

(define (make-heap . n)
  (define (iter hp ls)
    (if (null? ls)
        hp
        (iter (heap-insert hp (car ls))
              (cdr ls))))
  (iter (vector) n))

(make-heap 3 1 9 6 2 5)
;; '#(1 2 5 6 3 9)

(define (kill-head-put-tail hp)
  (if (< (vector-length hp) 2)
      (vector)
      (let* ([last-indx (- (vector-length hp) 1)]
         [last-val (vector-ref hp last-indx)]
         [new-vec (make-vector last-indx last-val)])
        (vector-copy! new-vec 1 hp 1 last-indx)
        new-vec)))

(kill-head-put-tail '#(1 2 5 6 3 9))
(kill-head-put-tail '#(1 2))
(kill-head-put-tail '#(1))

(define (heap-remove hp)
  (let ([firts (vector-ref hp 0)]
        [swapped-vec (kill-head-put-tail hp)])
    (sink swapped-vec 0)))
