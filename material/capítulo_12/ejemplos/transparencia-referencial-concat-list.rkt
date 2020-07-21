#lang lazy
(define concat-list
  (lambda (lst1 lst2)
    (append lst1 lst2)))
	 
(equal? (concat-list '(0 1 2) '(3 4 5)) '(0 1 2 3 4 5))
; #t
	 
(define concat-list-v2
  (lambda (lst1 lst2)
    (cond
      [(null? lst1) lst2]
      [else (cons (car lst1)
                  (concat-list-v2 (cdr lst1) lst2))]
      )))
	 
(equal? (concat-list-v2 '(0 1 2) '(3 4 5))
        '(0 1 2 3 4 5))
; #t
(equal? (concat-list '(0 1 2) '(3 4 5))
        (concat-list-v2 '(0 1 2) '(3 4 5)))
; #t
