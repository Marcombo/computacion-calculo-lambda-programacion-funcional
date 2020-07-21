#lang racket

(require syntax/parse)
(require "while.rkt")
(require "lexer.rkt")

(define variables (make-hash))

(define (interpret-program program-stx)
    (syntax-parse program-stx
      
      [({~literal program} program-1 ";" program-2)
       (interpret-program #'program-1)
       (interpret-program #'program-2)
       ]
      
      [({~literal program} "if" bool "then" program-1
                           "else" program-2)
       (if (interpret-bool #'bool)
           (interpret-program #'program-1)
           (interpret-program #'program-2))
       ]
      
      [({~literal program} "while" bool "do" program-1)
       (cond
         [(equal? (interpret-bool #'bool) #t)
          (interpret-program #'program-1)
          (interpret-program program-stx)]
         [else  null])
      ]
      
      [({~literal program} "print" "(" expr-1 ")")
        (displayln (interpret-exprs #'expr-1))
      ]

      [({~literal program} var ":=" expr-1) 
        (if (hash-has-key? variables
                           (second
                            (syntax->datum #'var)))
            (dict-set! variables
                       (second (syntax->datum #'var))
                       (interpret-exprs #'expr-1))
            (dict-set! variables
                       (second (syntax->datum #'var))
                       (interpret-exprs #'expr-1)))
      ]
    )
  )

(define (interpret-bool bool-stx)
    (syntax-parse bool-stx
      [({~literal bool} "true") #t ]
      [({~literal bool} "false") #f ]
      [({~literal bool} "(" expr-1 "=" expr-2 ")")
        (= (interpret-exprs #'expr-1)
           (interpret-exprs #'expr-2))
      ]
      [({~literal bool} "(" bool-1 "&" bool-2 ")")
        (equal? (interpret-bool #'bool-1)
                (interpret-bool #'bool-2))
      ]
      [({~literal bool} "¬" bool-1)
        (not (interpret-bool #'bool-1))
      ]
    )
  )

(define (interpret-exprs expr-stx)
    (syntax-parse expr-stx
      
      [({~literal exprs} expr)
       (syntax-parse #'expr
         [({~literal num} n)
          (syntax->datum #'n)
         ]
         [({~literal var}  variable)
           (if (hash-has-key?
                variables (syntax->datum #'variable)) 
               (dict-ref variables
                         (syntax->datum #'variable))
               0)
         ]
       )
      ]
      
      [({~literal exprs}
        "(" expr-1 "+" expr-2 ")")
        (+ (interpret-exprs #'expr-1)
           (interpret-exprs #'expr-2))
      ]
      
      [({~literal exprs}
        expr-1 "+" expr-2)
        (+ (interpret-exprs #'expr-1)
           (interpret-exprs #'expr-2))
      ]
    )
  )

(define run
  (lambda (input)
    (interpret-program input)
  )
)   
(provide run)
