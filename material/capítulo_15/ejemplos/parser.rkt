#lang racket

(require syntax/parse)
(require "while.rkt")

(define (parser lexer)
    (parse lexer)
)
(provide parser)