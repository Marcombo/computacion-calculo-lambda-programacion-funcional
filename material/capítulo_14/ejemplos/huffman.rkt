#lang racket
(struct node (value left right) #:transparent)

(define sequence (string->list "AEEEADDECA"))

(define freq (make-immutable-hash))

(define (increment-freq freq key)
  (if (hash-has-key? freq key)
      (+ 1 (hash-ref freq key))
      1))

(define (calculate-freq sequence freq)
  (if (null? sequence) freq
      (calculate-freq
       (cdr sequence)
       (hash-set
        freq
        (car sequence)
        (increment-freq freq (car sequence))
        ))))

(define (create-tree sum-value left right)
  (node sum-value left right))

(define (create-huffman-tree nodes tree)
  (if (null? nodes) tree
      (cond [(<= (node-value tree) (cdr (car nodes)))
             (create-huffman-tree
              (cdr nodes)
              (create-tree
               (+ (node-value tree) (cdr (car nodes)))
               tree
               (caar nodes)))]
            [else
             (create-huffman-tree
              (cdr nodes)
              (create-tree
               (+ (node-value tree) (cdr (car nodes)))
               (caar nodes)
               tree))]
            )))

(define (huffman nodes)
  (cond
    [(= (length nodes) 0)
     (raise '"Error. Sequence is empty" #t)]
    [(>= (length nodes) 2)
     (create-huffman-tree
      (cddr nodes)
      (create-tree
       (+ (cdr (car nodes)) (cdr (second nodes)))
       (caar nodes)
       (car (second nodes))
       ))]
    [else
     (create-huffman-tree
      (cdr nodes)
      (create-tree
       (cdr (car nodes))
       (caar nodes)
       null
       ))]))

(define nodes-freq (calculate-freq sequence freq))
(define nodes-key (hash-keys nodes-freq))
(define huffman-tree (huffman (sort (hash->list nodes-freq) #:key cdr <)))
(displayln huffman-tree)
; #(struct:node 10 E #(struct:node 6 #(struct:node 3 C D) A))

(require racket/hash)
(define (decoding tree binary)
  (cond
    [(char? tree) (hash tree binary)]
    [(null? tree) (make-hash)]
    [else
     (let*
         ([left (node-left tree)]
          [right (node-right tree)])
       (hash-union
        (decoding left (string-append binary "0"))
        (decoding right (string-append binary "1"))))
     ]))
(displayln (decoding huffman-tree ""))
; #hash((A . 11) (C . 100) (D . 101) (E . 0))

