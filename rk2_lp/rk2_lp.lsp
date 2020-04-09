; Дан смешанный, структурированный список 
; (т.е. любой элемент списка может быть: символ, число или список)


(defun getOneLstHelper (lst newlst)
	(cond ((null lst) newlst)
          ((atom lst) (cons lst newlst))
		  (t (getOneLstHelper (car lst) (getOneLstHelper (cdr lst) newlst) ))
    )
)
; getOneLstHelper - функция делающая из смешанного 
; структурированного списка обычный смешанный список

(defun getOneLst (lst)
    (
        getOneLstHelper lst nil
    )
)
; getOneLst - функция обертка
; (getOneLst (list 1 2 3 (list 4 5 ) 6 (list 7 8 9 (list 10 11 12) ))

; Найти сумму четных чисел на всех уровнях заданного списка, 
; лежащих в заданном интервале [a, b]



(defun goToN(lst n)
    (cond
        ( (or (< n 0) (> n (length lst)) 
                (null (car lst))) (list 0) )
        ( (= n 0) lst )
        ( t (goToN (cdr lst) (- n 1)))
    )
)
; goToN - функция, сдвигающая список к позиции n

(defun getSumHelper (lst sum)
    (cond   
        ( (null (car lst)) sum )
        ( t (getSumHelper (cdr lst) 
            (if (and (numberp (car lst)) (not (oddp (car lst))) )
                (+ sum (car lst))
                (+ sum 0)
            )
        ) )
    )
)
; getSumHelper - функция помошник, считающая 
; сумму четных элементов, являющихся числом

(defun getSum(lst)
    (getSumHelper lst 0)
)


; getSum - функция-обертка, запускающая сдвинутый список 
; на позицию a, и передающая этот параметр в функцию помошник
; с параметром sum, равным 0

; Добавить найденную сумму к исходному списку, в качестве  
; К-ого элемента верхнего уровня или в конец. Если чисел нет, сообщить об этом

(defun getListABhelper (lst b)
    (cons 
        (if (not (null lst))
            (car lst)
        )

        (cond
            ( (< b 0) nil)
            ((or (= b 0) (= (length (cdr lst)) 1)) (cons (cadr lst) nil))
            (t (getListABhelper (cdr lst) (- b 1)))
        )
    )
)

(defun getListAB (lst a b)
    (
        getListABhelper (goToN lst a) (- b (+ a 1))
    )
)

; (defun getListAB (lst a b)
;     (
;         if (> a b)
;             nil
;             (getListABhelper (goToN lst a) (- b (+ a 1)))
;     )
; )

(defun insert_element_helper (lst k element new_lst)
       (cond
         (
          (null lst)
          new_lst
          )
          (
           (= k 0)
           (insert_element_helper (cdr lst) (- k 1) element (cons (car lst) (cons element new_lst)))
           )
          (
           (insert_element_helper (cdr lst) (- k 1) element (cons (car lst) new_lst))
           )
          )
       )
 
Вспомогательная функция-обертка для вставки элемента на k-ую позицию:
(defun insert_element (lst element k)
       (reverse (insert_element_helper lst k element nil))
)

; *Преобразовать исходный список в одноуровневый, сохранив порядок, 
; но удалив числа (для max-х баллов)

(defun rk2 (lst a b k)
    (
       getOneLst (insert_element lst (getSum (getOneLst (getListAB lst a b))) k)
    )
)

(rk2 (list 1 2 (list 1 2 3 4 (list 1 2 3 4 5) 5) 1 2 3) 2 2 2)