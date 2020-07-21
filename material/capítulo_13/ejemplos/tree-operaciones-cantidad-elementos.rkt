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

(define count-tree
  (lambda (tree)
    (cond
      [(null? tree) 0]
      [else
       (+ 1 (count-tree (node-left tree))
          (count-tree (node-right tree)))]
      )
    )
  )
(count-tree tree)
; 9
