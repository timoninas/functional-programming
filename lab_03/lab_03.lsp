; 1. Составить диаграмму вычисление для следующих выражений
(equal 3(abs - 3)) ; error
(equal (+ 1 2) 3)) ; T
(equal (* 4 7) 21)) ; NIL
(equal (* 2 3) (+ 7 2))) ; NIL
(equal (- 7 3) (* 3 2))) ; NIL
(equal (abs(-2 4)) 3)) ; error

; 2. Функция которая вычисляет гипотенузу по заданным катетам

(defun countGip (a b) (sqrt (+ (* a a) (* b b))))

; 3. Функция которая вычисляет объем параллелепипеда по 3м сторонам

(defun volPar (a b c) (* a b c))

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

(defun longer_then (list1 list2) (> (length list1) (length list2)))

; 6. Написать результаты вычисления следующих выражений

(cons 3 (list 5 6)) ; (3 5 6)
(cons 3 '(list 5 6)) ; (3 LIST 5 6)
(list 3 'from 9 'lives) ; (3 FROM 9 LIVES)
(+ (length for 2 too)) ; variable FOR has no value
(car '(21 22 23))) ; 21
(cdr ' (cons is short for ans)) ; (IS SHORT FOR ANS)
(car (list one two)) ; variable ONE has no value
(car (list 'one 'two)) ; ONE

; 7. Дана функция (defun mystery (x) (list (second x) (first x))). 
; Написать результаты вычисления следующих выражений

(mystery (one two)) ; undefined function ONE
(mystery one 'two)) ; variable ONE has no value
(mystery (last one two)) ; variable ONE has no value
(mystery free) ; variable FREE has no value