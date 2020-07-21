#lang racket
(define checking-expr-struct
    (lambda (expr)
    (match expr
        [(list _ _)
        'two-element-list]
        [(list _ _ _)
        'three-element-list]
        [(hash-table (_ _))
            'two-element-hash]
    [else 'not-match])))
    
(checking-expr-struct (hash "cálculo" "lambda"))
; 'two-element-hash
(checking-expr-struct '(1 2 3))
; 'three-element-list
(checking-expr-struct '(1 2))
; 'two-element-list
(checking-expr-struct 1)
; 'not-match
