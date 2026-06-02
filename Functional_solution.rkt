#lang racket
; C. Vlad and a Sum of Sum of Digits
; Hacemos una funcion para los digitos que tienen dos numeros como 10, 20, 30

(define double-digits
  (lambda (n)
    (cond
      [(= n 0) 0]
      [else
       (+ (modulo n 10)
          (double-digits (quotient n 10)))])))

; Funcion para crear la lista
(define create-list
  (lambda (n counter my-list)
    (cond
      [(> counter n) my-list]
      [else
       (create-list n
                    (+ counter 1)
                    (cons (double-digits counter) my-list))])))

; Merge Sort para ordenar la lista
; Funcion para unir las dos listas ya ordenadas
(define merge
  (lambda (l1 l2)
    (cond
      [(null? l1) l2]
      [(null? l2) l1]
      ; Si primer elemento de l1 es menor
      ; toma el valor de la lista 1
      [(< (car l1) (car l2))
       (cons (car l1) (merge (cdr l1) l2))]
      [else
       ; toma la lista 2
       (cons (car l2) (merge (cdr l2) l1))])))

; Obtenemos los numeros en posiciones impares 
(define split-odd
  (lambda (l)
    (cond
      [(null? l) '()]
      ; Si hay un elemento regresa ese elemento
      [(null? (cdr l)) l]
      [else
       ; Toma el primer elemento de la lista
       (cons (car l) (split-odd (cdr (cdr l))))])))

; Ordenamos la lista con los numeros de la lista pares
(define split-even
  (lambda (l)
    (cond
      [(null? l) '()]
      [(null? (cdr l)) '()]
      [else
       ; Tomas el segundo elemento, hay saltos de dos en dos
       (cons (car (cdr l)) (split-even (cdr (cdr l))))])))

; Funcion que ordena la lista
(define merge-sort
  (lambda (l)
    (cond
      [(null? l) l]
      [(null? (cdr l)) l]
      [else
       ; Se unen las dos mitades
       (merge
        ; Se ordena posiciones impares
        (merge-sort (split-odd l))
        ; Se ordena en posiciones pares 
        (merge-sort (split-even l)))])))

; Suma todos los elementos de la lista
; Vamos sumano elementos de la lista
; Hasta dejarla vacia 
(define suma-lista
  (lambda (my-list)
    (cond
      [(empty? my-list) 0]
      [else
       (+ (first my-list)
          (suma-lista (rest my-list)))])))

;Funcion principal donde llamamos todo
; Suma la lista ordenada 
(define vlad-sum
  (lambda (n)
    (suma-lista (merge-sort (create-list n 1 '())))))

;; Casos de prueba
(define caso_1  12)
(define caso_2  1)
(define caso_3  5)
(define caso_4  9)
(define caso_5  200000)

;; Llamadas directas
(vlad-sum caso_1)
(vlad-sum caso_2)
(vlad-sum caso_3)
(vlad-sum caso_4)
(vlad-sum caso_5)