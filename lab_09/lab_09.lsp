; 2. Написать предикат set-equal, который возвращает t, если два его множество-
; аргумента содержат одни и те же элементы, порядок которых не имеет значения.

(defun eqLst (lst1 lst2) 
    (and (subsetp lst1 lst2) (subsetp lst2 lst1))
)

; 3. Напишите необходимые функции, которые обрабатывают таблицу из точечных пар:
; (страна. столица), и возвращают по стране - столицу, а по столице - страну.

(defun createPairs(lst1 lst2)
    (list (cons (car lst1) (car lst2))
          (cons (cadr lst1) (cadr lst2))
          (cons (caddr lst1) (caddr lst2))
          (cons (cadddr lst1) (cadddr lst2))
    )  
) 

(setq lst1 '(Rus Ukr Blr Kaz))

(setq lst2 '(Moscow Kiev Minsk Astana))

(setq pair1 (createPairs lst1 lst2))

(defun searchEl (pairs element)
    (cond
        ((null pairs) Nil)
        ( (equal (caar pairs) element) (cdar pairs) )
        ( (equal (cdar pairs) element) (caar pairs) )
        (t (searchEl (cdr pairs) element))
    )
)

(defun check (el el1)
    (format t "~A and ~A ~%" el el1)
)

(defun goThen(pairs element)
    (mapcar #'outPut pairs element)
)


; 7. Напишите функцию, которая умножает на заданное число-аргумент все числа
; из заданного списка-аргумента, когда 
; a) все элементы списка --- числа,
; 6) элементы списка -- любые объекты.

; a) все элементы списка --- числа,

(defun multNum1 (lst num)
    (mapcar #'(lambda (x) (* x num))
        lst
    )
)

(defun multNum2 (lst number)
    (cons 
        (if (not (null lst))
            (* (car lst) number)
        )

        (cond
            ((< (length (cdr lst)) 1) Nil)
            (t (multNum (cdr lst) number))
        )
    )
)

; 6) элементы списка -- любые объекты.

(defun multAll (lst num)
    (mapcar 
        #'(lambda (x) 
                (cond 
                    ((numberp x) (* x num))
                    ((listp x) (multAll x num))   
                    (t x) 
                )
          ) lst

    )
)

; 2. Напишите функцию, которая уменьшает на 10 все числа из списка аргумента этой функции.

(defun allMinus (lst)
    (mapcar 
        #'(lambda (x) 
                (cond 
                    ((numberp x) (- x 10))
                    ((listp x) (allMinus x))   
                    (t x) 
                )
          ) lst
    )
)

; (and (listp ()) (>(length (list 1 2 3)) 0))

; 3. Написать функцию, которая возвращает первый аргумент списка -аргумента. который сам является 
; непустым списком.

(and (listp 1) (>(length 1) 0))

(defun firstList (lst)
    (cond 
        ((null (cdr lst)) nil)
        ((and (listp (car lst)) (> (length (car lst)) 0)) (car lst))
        (t (firstList (cdr lst)))
    )
)

; BAD WORk
(defun firstList2 (lst)
    (mapcar 
        #'(lambda (x) 
                (cond 
                    ( (and (listp x) (> (length x) 0)) x )
                    ; (t x) 
                )
          ) lst
    )
)

; 4. Написать функцию, которая выбирает из заданного списка только те числа, 
; которые больше 1 и меньше 10.
; (Вариант: между двумя заданными границами. )

(defun numInterval (lst start end) ; Плохо работает
    (
        cons (car lst)
            (cond
                ((< (length (cdr lst)) 1) Nil)
                ; ((listp lst) (numInterval start end))
                ((and (numberp (cadr lst)) (> (cadr lst) start) (< (cadr lst) end)) (numInterval (cdr lst) start end))
            )
    )
)

(defun selectBetweenInner (lst left right result)
	(mapcar	#'(lambda (x)
					(cond	((listp x) (selectBetweenInner x left right result))
							((and	(numberp x) (> x left) (< x right))
								(nconc result (cons x nil))
							)
					)
				)
			lst
	)
	(cdr result)
)
(defun selectBetween (lst left right);						
	(selectBetweenInner lst left right (cons nil nil))
)



; 5. Написать функцию, вычисляющую декартово произведение двух своих списков- аргументов. 
; (Напомним, что А х В это множество всевозможных пар (a b), где а принадлежит А, принадлежит В.)

(defun decart (a b) 
    (mapcan #'
        (lambda (x) 
            (mapcar #'
                (lambda (y) (list x y))
                a
            )
        )
        b
    )
)

; 6. Почему так реализовано reduce? 
(reduce #*+0) -> 0 ; Ошибка
(reduce #*+ ()) -> 0 ; Вернет изначальное значение сложения 0






; Постараться реализовать с помощью функционалов и рекурсии