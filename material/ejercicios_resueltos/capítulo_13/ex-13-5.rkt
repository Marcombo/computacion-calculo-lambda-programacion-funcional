#lang racket

(define (set-insert el s)
  (if (member el s)
      s
      (cons el s)))

(define (make-set . lst)
  (foldr set-insert null lst))

(define s1 (make-set 1 2 3))
s1
;; '(1 2 3)
(define s2 (make-set '2 5))
s2
;; '(2 5)

(set-insert 5 s1)
;; '(5 1 2 3)

(set-insert 3 s1)
;; '(1 2 3)

(define (set-intersection s1 s2)
  (let* ([longest-set (if (>= (length s1) (length s2)) s1 s2)]
         [shortest-set (if (equal? longest-set s1) s2 s1)])
    (filter (λ (el) (member el shortest-set)) longest-set)))

(set-intersection s1 s2)
;; '(2)

(define (set-union s1 s2)
  (apply make-set (append s1 s2)))

(set-union s1 s2)
;; '(1 3 2 5)

;; Como extra, ya que los sets no tienen orden, haremos una función
;; para compararlos
(define (set-equal-? s1 s2)
  (and (= (length s1) (length s2))
       (not (eq? #f 
                 (ormap (λ (el) 
                          (member el s2))
                        s1)))))

(set-equal-? s1 s2)
;; #f
(define s3 (make-set 3 2 1))
s3
;; '(3 2 1)

(set-equal-? s1 s3)
;; #t
