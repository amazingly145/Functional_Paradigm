#lang racket
; C. Vlad and a Sum of Sum of Digits
; Hacemos una funcion para los digitos que tienen dos numeros como 10, 20, 30

(define double-digits
  (lambda (n)
    (cond
      ;caso base
      ;hasta que el cosciente sea cero
      ;signfica que ya no se puede dividir mas veces
      [(= n 0) 0]
      [else
       (+ (modulo n 10)
          ; hasta que te quede el digito con un solo numero
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

; Obtenemos los primeros numeros
; impar
(define split-firsts
  (lambda (l)
    (cond
      [(null? l) '()]
      ; Si hay un elemento regresa ese elemento
      [(null? (cdr l)) l]
      [else
       ; Toma el primer elemento de la lista
       (cons (car l) (split-firsts (cdr (cdr l))))])))

; Ordenamos los segundos numero
; par 
(define split-seconds
  (lambda (l)
    (cond
      [(null? l) '()]
      [(null? (cdr l)) '()]
      [else
       ; Tomas el segundo elemento, hay saltos de dos en dos
       (cons (car (cdr l)) (split-seconds (cdr (cdr l))))])))

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
        (merge-sort (split-firsts l))
        ; Se ordena en posiciones pares 
        (merge-sort (split-seconds l)))])))

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
(define caso_6 1434)
(define caso_7 2024)
(define caso_8 300000)

;;We call de cases
(vlad-sum caso_1)
(vlad-sum caso_2)
(vlad-sum caso_3)
(vlad-sum caso_4)
(vlad-sum caso_5)
(vlad-sum caso_6)
(vlad-sum caso_7)
(vlad-sum caso_8)