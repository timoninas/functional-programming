; 1. Составить диаграмму вычисление для следующих выражений
(equal 3(abs - 3)) ; error
(equal (+ 1 2) 3)) ; T
(equal (* 4 7) 21)) ; NIL
(equal (* 2 3) (+ 7 2))) ; NIL
(equal (- 7 3) (* 3 2))) ; NIL
(equal (abs(-2 4)) 3)) ; error

; 2. Функция которая вычисляет гипотенузу по заданным катетам


; 3. Функция которая вычисляет объем параллелепипеда по 3м сторонам


; 4. Написать результаты вычисления следующих выражений
(list 'a c) ; variable C has no value
(cons'a'b'c) ; too many arguments given to CONS
(cons'a (b c)) ; undefined function B
(list 'a (b c)) ; undefined function B 
(cons'a '(b c)) ; (A B C)
(list a '(b c)) ; variable A has no value
(caddy (1 2 3 4 5)) ; undefined function CADDY
(list (+ 1 '(length '(1 2 3)))) ; +: (LENGTH '(1 2 3)) is not a number

; 5. Написать функцию longer_then от двух списков-аргументов, 
; которая возвращает Т, если первый аргумент имеет большую длину.

; 6. Написать результаты вычисления следующих выражений

(cons 3 (list 5 6))
(cons 3 '(list 5 6))
(list 3 'from 9 'lives (- 9 3))
(+ (length for 2 too))
(car '(21 22 23)))
(cdr ' (cons is short for ans))
(car (list one two))
(car (list 'one 'two))

; 7. Дана функция (defun mystery (x) (list (second x) (first x))). 
; Написать результаты вычисления следующих выражений

(mystery (one two))
(mystery one 'two))
(mystery (last one two))
(mystery free)

 ; 8. Написать функцию, которая переводит температуру в системе Фаренгейта 
; температуру по Цельсию (defum f-to-c (temp)…). Формулы: c = 5/9*(f-320); 
; f= 9/5*c+32.0. Как бы назывался роман Р.Брэдбери "+451 по Фаренгейту" в 
; системе по Цельсию?

; 9. Написать что получится при вычисления каждого из выражений

(list 'cons t NIL)
(eval (list 'cons t NIL))
(eval (eval (list 'cons t NIL)))
(apply #cons "(t NIL))
(eval NIL)
(list 'eval NIL)
(eval (list 'eval NIL))

; Доп 1. Написать функцию, вычисляющую катет по заданной гипотенузе 
; и другому катету прямоугольного треугольника, и составить 
; диаграмму ее вычисления.

; Доп 2. Написать функцию, вычисляющую площадь трапеции по ее 
; основаниям и высоте, и составить диаграмму ее вычисления.

