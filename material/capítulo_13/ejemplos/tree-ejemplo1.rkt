#lang racket
(struct node (value left right))
(define tree
  (node 9
        (node 7
              (node 5
                    (node 1 null null)
                    (node 6 null null))
              (node 8 null null))
        (node 10 null
              (node 11 null
                    (node 12 null null)))))
