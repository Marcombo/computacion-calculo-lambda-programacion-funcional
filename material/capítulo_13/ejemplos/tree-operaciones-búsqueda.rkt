#lang racket
(struct node (value left right))

(define (create-binary-tree lst)
  (if (null? lst) null
      (cond
        [(null? (cdr lst)) (node (car lst) null null)]
        [else (let* 
                  ([value (car lst)]
                   [tail (cdr lst)]
                   [left
                    (filter
                     (lambda (v) (< v value)) tail)]
                   [right
                    (filter
                     (lambda (v) (>= v value)) tail)])
                (node value
                      (create-binary-tree left)
                      (create-binary-tree right)))]
        )
      )
  )
(define tree (create-binary-tree (list 9 7 5 1 6 8 10 11 12)))

(define search
  (lambda (tree value)
    (cond
      [(or (null? tree) (= value (node-value tree))) tree]
      [(> value (node-value tree))
       (search (node-right tree) value)]
      [else (search (node-left tree) value)]
      )
    )
  )
	 
(if (null? (search tree 10)) 'not-found 'found)
; 'found
