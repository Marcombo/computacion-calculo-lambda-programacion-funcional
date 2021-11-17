#lang racket


;;; Creadores es inspectores

;; Al encapsular la estructura de datos con creadores e inspectores,
;; cuando queramos cambiar la implementación sólo tendremos que
;; modificar esto, y no el resto del sistema.

;; Definimos dos creadores de nodes a partir de listas para poder
;; visualizar el resultado de las llamadas en forma de lista.
(define (make-node value left right)
  (list value left right))

(define (start-node value)
  (make-node value null null))

;; A continuación, los inspectores
(define (node-value node)
  (car node))

(define (node-left node)
  (cadr node))

(define (node-right node)
  (caddr node))

(define (node-childs node)
  (list (node-left node)
        (node-right node)))

(define (min-succesor tree)
    (if (null? (node-left tree))
        (node-value tree)
        (min-succesor (node-left tree))))

;;; Predicados

(define (node-leave? node)
  (andmap null? (node-childs node)))

(define (node-single-child? node)
  (apply xor (map null? (node-childs node))))

;;; Funciones auxiliares

;; Negación de un predicado, para no tener que insertar una expresión
;; lambda sólo para el caso.
(define (not? p?)
  (λ (x) (not (p? x))))

(define (node-single-child node)
  (unless (node-single-child? node)
    (error "node should have only one child."))
  (car (filter (not? null?) (node-childs node))))

;; Pequeño método de ayuda que cambia el orden de los argumentos en
;; una función binaria. Es decir (flip +) hace que (/ a b) se
;; convierta en (/ b a). Esto lo usaremos a continuación, en
;; make-tree-from-list.
(define (flip fn)
  (λ (a b) (fn b a)))

;;; Inserción de datos

;; Definimos la función para insertar valores en un árbol binario
(define (binary-tree-insert tree value)
  (define (insert-node-at wich [new-val #f])
    (let* ([start (start-node value)]
           [wich-value (or new-val start)]
           [left (if (equal? wich 'left) wich-value (node-left tree))]
           [right (if (equal? wich 'right) wich-value (node-right tree))])
      (make-node (node-value tree) left right)))
  (cond [(null? tree) (start-node value)]
        [(> value (node-value tree))
         (insert-node-at 'right (and (not (null? (node-right tree)))
                                     (binary-tree-insert (node-right tree) value)))]
        [(< value (node-value tree))
         (insert-node-at 'left (and (not (null? (node-left tree)))
                                    (binary-tree-insert (node-left tree) value)))]
        [else tree]))

;; Ahora podemos definir la creación de un árbol binario a partir de
;; binary-tree-insert de manera muy sencilla, usando la función foldl
;; y ayudándonos de la función flip, que evitará que usemos una lambda
;; y mejorando la legibilidad del código.
(define (make-tree-from-list lst)
  (foldl (flip binary-tree-insert) null lst))


(define my-tree (make-tree-from-list (list 9 7 5 1 6 8 10 11 12)))

my-tree
;; '(9 (7 (5 (1 () ()) (6 () ())) (8 () ())) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   7    10
;;                  / \     \
;;                 /   \     \
;;                5     8    11
;;               / \           \
;;              /   \           \
;;             1     6           12

(binary-tree-insert my-tree 4)
;; '(9 (7 (5 (1 () (4 () ())) (6 () ())) (8 () ())) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   7    10
;;                  / \     \
;;                 /   \     \
;;                5     8    11
;;               / \           \
;;              /   \           \
;;             1     6           12
;;            /
;;           /
;;          4


;;; Eliminación de datos

;; Para eliminar un elemento, buscamos el elemento situada más abajo y
;; a la derecha. Eliminamos el elemento x y lo sustituimos con este
;; último, el cual eliminamos también.

(define (binary-tree-remove tree value)
  (cond [(null? tree) tree]
        [(> value (node-value tree))
         (make-node (node-value tree)
                    (node-left tree)
                    (binary-tree-remove (node-right tree) value))]
        [(< value (node-value tree))
         (make-node (node-value tree)
                    (binary-tree-remove (node-left tree) value)
                    (node-right tree))]
        [else (cond [(node-leave? tree) null]
                    [(node-single-child? tree) (node-single-child tree)]
                    [else (let ([min-sucss (min-succesor (node-right tree))])
                            (make-node min-sucss
                                       (node-left tree)
                                       (binary-tree-remove (node-right tree)
                                                           min-sucss)))])]))

;; Eliminar un nodo sin hijos
(binary-tree-remove my-tree 12)
;; '(9 (7 (5 (1 () ()) (6 () ())) (8 () ())) (10 () (11 () ())))

;;                      9
;;                     / \
;;                    /   \
;;                   7    10
;;                  / \     \
;;                 /   \     \
;;                5     8    11
;;               / \ 
;;              /   \ 
;;             1     6

(binary-tree-remove my-tree 8)
;; '(9 (7 (5 (1 () ()) (6 () ())) ()) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   7    10
;;                  /       \
;;                 /         \
;;                5          11
;;               / \           \
;;              /   \           \
;;             1     6           12

;; Eliminar un nodo con un solo hijo
(binary-tree-remove my-tree 10)
;; '(9 (7 (5 (1 () ()) (6 () ())) (8 () ())) (11 () (12 () ())))

;;                      9
;;                     / \
;;                    /   \
;;                   7     11
;;                  / \     \
;;                 /   \     \
;;                5     8     12
;;               / \ 
;;              /   \ 
;;             1     6 

(binary-tree-remove (binary-tree-remove my-tree 8) 7)
;; '(9 (5 (1 () ()) (6 () ())) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   5     10
;;                  / \     \
;;                 /   \     \
;;                1     6     11
;;                             \
;;                              \
;;                               12

;; Eliinar un nodo con dos hijos
(binary-tree-remove my-tree 7)
;; '(9 (8 (5 (1 () ()) (6 () ())) ()) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   8     10
;;                  /       \
;;                 /         \
;;                5           11
;;               / \           \
;;              /   \           \
;;             1     6           12

(binary-tree-remove my-tree 5)
;; '(9 (7 (6 (1 () ()) ()) (8 () ())) (10 () (11 () (12 () ()))))

;;                      9
;;                     / \
;;                    /   \
;;                   7    10
;;                  / \     \
;;                 /   \     \
;;                6     8    11
;;               /             \
;;              /               \
;;             1                 12
