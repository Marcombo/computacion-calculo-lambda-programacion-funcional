#lang racket

;;; Estructuras de datos

;; Definimos la estructura punto con las coordenadas x e y
(struct point (x y) #:transparent)

;; En función de las coordenadas, definimos triángulo como una
;; estructura de tres punto, con el vértice solitario siempre hacia
;; arriba, ya que es lo que necesitamos para este problema.
(struct triangle (upper left right) #:transparent)

;; Función para calcular la altura de un triángulo equilátero. La
;; parte de la raíz cuadrada de 3 entre 2 la sacamos fuera, en una
;; variable para que se calcule cada vez.
(define 3-sqrt/2 (/ (sqrt 3) 2))

(define (height side)
  (* side 3-sqrt/2))

;; Función para calcular la longitud de un lado, dado un triángule
;; equilátero
(define (side trngl)
  (- (point-x (triangle-right trngl))
     (point-x (triangle-left trngl))))

;; En función de estas dos estructuras, definimos la forma de crear un
;; triángulo equilátero a partir del punto del vértice de abajo a la
;; izquierda y un lado, hacinedo uso de la altura
(define (make-triangle left-point side)
  (let ([left-x (point-x left-point)]
        [left-y (point-y left-point)])
    (triangle (point (+ left-x (/ side 2))
                     (+ left-y (height side)))
              left-point
              (point (+ left-x side) left-y))))

;; Esta función recibe un triángulo y devuelve una lista con los tres
;; triángulos internos que contiene, de forma que quede un triángulo
;; vacío invertido en el centro
(define (divide-by-three trngl)
  (let* ([t-side (/ (side trngl) 2)]
         [left (make-triangle (triangle-left trngl) t-side)]
         [right (make-triangle (triangle-right left) t-side)]
         [upper (make-triangle (triangle-upper left) t-side)])
    `(,left ,right ,upper)))

;; Esta función recibe un triángulo y el número de recursiones, y
;; devuelve una lista formada por el triángulo de sierpinski.
(define (sierpinski-triangle trngl n)
  (if (= n 0)
      null
      (let ([inner-triangles (divide-by-three trngl)]
            [sierpinski-next (λ (t) (sierpinski-triangle t (- n 1)))])
        (append `(,trngl)
                (append-map sierpinski-next inner-triangles)))))

(sierpinski-triangle (make-triangle (point 0 0) 4) 2)

;; (list
;;  (triangle (point 2 3.4641016151377544) (point 0 0) (point 4 0))
;;  (triangle (point 1 1.7320508075688772) (point 0 0) (point 2 0))
;;  (triangle (point 3 1.7320508075688772) (point 2 0) (point 4 0))
;;  (triangle (point 2 3.4641016151377544) (point 1 1.7320508075688772) (point 3 1.7320508075688772)))
