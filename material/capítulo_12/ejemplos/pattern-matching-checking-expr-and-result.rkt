#lang racket
(define checking-expr-and-result
    (lambda (expr)
    (match expr
        [(list a b)
        #:when (= 20 (+ a b))
        'sum-is-twenty]
        [(list a b)
        #:when (= 30 (+ a b))
        'sum-is-thirty]
        [else 'not-match])))
    
(checking-expr-and-result '(10 10))
; ‘sum-is-twenty
(checking-expr-and-result '(15 15))
; ‘sum-is-thirty
(checking-expr-and-result '(10))
; ‘not-match
