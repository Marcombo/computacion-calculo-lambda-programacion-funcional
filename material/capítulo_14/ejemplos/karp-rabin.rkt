#lang racket
(define (calculate-hash-specific h C i b m)
  (+ h
     (*
      (char->integer (list-ref C i))
      (expt b (- (- m i) 1))
      )))
	 
(define (calculate-hash-general T P b m h_y h_x i)
  (if (< i m)
      (calculate-hash-general T P b m
                              (calculate-hash-specific h_y T i b m)
                              (calculate-hash-specific h_x P i b m)
                              (+ i 1))
      (list h_y h_x)))
	 
(define (update-hash h b q d m C i)
  (let* ([h (modulo
             (+ h
                (-
                 (* b q)
                 (* (char->integer
                     (list-ref C i)) d)))
             q)]
         [h (modulo
             (+ (* h b)
                (char->integer
                 (list-ref C (+ i m))))
             q)])
    h))
	 
(define (matcher T P b d q m n h_y h_x i)
  (if (< i (+ (- n m) 1))
      (cond [(and (= h_y h_x)
                  (equal? (list->string P)
                          (substring (list->string T)
                                     i (+ i m))))
             (list "Encontrado" i)]
            [(< (+ i m) n)
             (matcher T P b d q m n
                      (update-hash h_y b q d m T i)
                      h_x
                      (+ i 1))]
            [else -1])
      -1))
	         
(define (karp-rabin T P b q)
  (let* ([n (length T)]
         [m (length P)])
    (if (> m n)
        -1
        (let* ([d (modulo (expt b (- m 1)) q)]
               [hashes
                (calculate-hash-general T P b m 0 0 0)]
               [h_y (modulo (first hashes) q)]
               [h_x (modulo (last hashes) q)])
          (matcher T P b d q m n h_y h_x 0)
          ))))
	 
(karp-rabin
 (string->list "culo")
 (string->list "lambda") 256 8355967)
; ‘(Encontrado, 8) 
