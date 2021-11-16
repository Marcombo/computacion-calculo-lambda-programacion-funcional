#lang racket

;;; Definimos alguas funciones auxiliares genéricas
(define (not-false? val)
  (not (eq? #f val)))

(define (any p? lst)
  (not-false? (ormap p? lst)))

(define (all p? lst)
  (not-false? (andmap p? lst)))

(define (shorter-list list-of-lists)
  (define (null-or-empty-? lst)
    (or (null? lst) (empty? lst)))
  (foldl (λ (lst res)
           (cond [(null-or-empty-? res) lst]
                 [(null-or-empty-? lst) res]
                 [(< (length res) (length lst)) res]
                 [else lst]))
         null
         list-of-lists))

;;; Deifinimos la estructura de datos
(define (make-node node . edges)
  (cons node edges))

(define (make-grapth . nodes)
  nodes)

(define (node-value node)
  (car node))

(define (node-edges node)
  (cdr node))

(define (node-grade node)
  (length (node-edges node)))

(node-grade (make-node 3 1 5))
;; 2

(define (node-find val graph)
  (assoc val graph))

(node-find 1 (make-grapth (make-node 2 3 4)
                          (make-node 1 2 3)))
;; '(1 2 3)

;;; Algunos predicados
(define (node=? n1 n2)
  (and (= (node-value n1) (node-value n2))
       (= (length n1) (length n2))
       (let ([n1-edges (node-edges n1)])
         (all (λ (n2-edge)
                (member n2-edge n1-edges))
              (node-edges n2)))))

(node=? (make-node 1 2 3) (make-node 1 3 2))
;; #t
(node=? (make-node 1 2 3) (make-node 1 4 2))
;; #f
(node=? (make-node 1 2 3) (make-node 3 2 1))
;; #f

(define (node-exists? node graph)
  (ormap (λ (graph-node)
           (node=? node graph-node))
         graph))

(define graph (make-grapth (make-node 4 5 7 8)
                           (make-node 3)
                           (make-node 1 2 3)
                           (make-node 2 10)))

(node-exists? (make-node 1 2 3) graph)
;; #t

(define graph2 (make-grapth (make-node 4 5 7 8)
                            (make-node 3)
                            (make-node 2 10)))

(node-exists? (make-node 1 2 3) graph2)
;; #f

(define (node-no-edges? node)
  (null? (node-edges node)))

(define (node-one-edge? node)
  (= (length (node-edges node)) 1))

(define (node-lonely-edge node)
  (if (node-one-edge? node)
      (car (filter (compose not null?) (node-edges node)))
      (error "Not a lonely node")))
;;; Camino más corto

(define (node-shorter-path start target graph)
  (define (iter node path [result null])
    (let ([actual-val (node-value node)]
          [target-val (node-value target)])
      (cond [(= actual-val target-val) (append path (list actual-val))]
            [(node-no-edges? node) null]
            [(node-one-edge? node)
             (iter (remove actual-val (node-find (node-lonely-edge node) graph))
                   (append path (list actual-val)))]
            [else (let ([not-visited-edges
                         (filter (λ (edge) (not (member edge path)))
                                 (node-edges node))])
                    (shorter-list (map (λ (edge)
                                         (iter (make-node actual-val edge)
                                               path))
                                       not-visited-edges)))])))
  (shorter-list (map (λ (edge)
                       (iter (remove (node-value start) (node-find edge graph))
                             (list (node-value start))))
                     (node-edges start))))

(define n1 (make-node 1 2 3 9))
(define n2 (make-node 2 1 4 6))
(define n3 (make-node 3 1 7 12 13))
(define n4 (make-node 4 2 5))
(define n5 (make-node 5 4))
(define n6 (make-node 6 2 11 12))
(define n7 (make-node 7 3 12))
(define n8 (make-node 8 11 12))
(define n9 (make-node 9 1 13))
(define n11 (make-node 11 6 8))
(define n12 (make-node 12 3 8 6 7))
(define n13 (make-node 13 3 9))

(define graph3 (make-grapth n1 n2 n3 n4 n5 n6 n7 n8 n9 n11 n12 n13))

(node-shorter-path n1 n12 graph3)
;;'(1 3 12)
