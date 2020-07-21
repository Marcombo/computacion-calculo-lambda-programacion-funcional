#lang racket
(require br-parser-tools/lex)
(require brag/support)

(define-lex-abbrev digits (:+ (char-set "0123456789")))
(define (lexer-tokenize ip)
    (port-count-lines! ip)
    (define my-lexer
      (lexer-src-pos
       [(:or "(" ")" ":=" "+" "&" ";" "¬" "if" "while" "="
             "print" "then" "do" "else" "true" "false")
        (token lexeme lexeme)]
       [lower-case (token 'VARIABLE lexeme)]
       [digits (token 'INT (string->number lexeme))]
       [whitespace
        (token 'WHITESPACE lexeme #:skip? #t)]
       [(eof)
        (void)]
       ))
    (define (next-token) (my-lexer ip))
    next-token)

(provide lexer-tokenize)