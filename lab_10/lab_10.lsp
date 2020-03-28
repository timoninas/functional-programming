
; 7. Пусть list-of-list список, состоящий из списков. Написать функцию,
; которая вычисляет сумму длин всех элементов list-of-list,
; т.е. например для аргумента ((1 2) (3 4)) -> 4.

(defun getLengthHelper (list-of-list sum) ; bad work
    (cond
        ((null (car list-of-list)) sum)

        ((atom (car list-of-list)) (getLengthHelper (cdr list-of-list) (+ 1 sum)))
        ( (listp (car list-of-list)) (getLengthHelper (car list-of-list) sum) )
    )
)

(defun getLength (list-of-list)
    (getLengthHelper list-of-list 0)
)

(defun getLength1 (list-of-lists)
    (reduce #'+
        (mapcar (lambda (lst)
                    (if (listp lst)
                        (getLength1 lst)
                        1
                    )
                ) list-of-lists
        )
    )
)


; 8. Написать рекурсивную версию (с именем reg-add) вычисления суммы чисел заданного списка.
; Например: (reg-add (2 4 6)) -> 12

(defun getSumHelper (lst sum)
    (cond
        ( (null (car lst)) sum )
        ( t (getSumHelper (cdr lst) (+ (car lst) sum)) )
    )
)

(defun reg-add (lst)
    (getSumHelper lst 0)
)

; 9. Написать рекурсивную версию с именем recnth функции nth.

(defun recnth(n lst)
    (cond
        ( (or 
            (< n 0) 
            (> n (length lst)) 
            (null (car lst)) 
          )  Nil )
        ( (= n 0) (car lst) )
        ( t (recnth (- n 1) (cdr lst)) )
    )
)

; 10. Написать рекурсивную функцию alloddr, которая возвращает t когда все
; элементы списка нечетные.

(defun allOddp (lst)
   (cond
        ((null (car lst)) t )
        ( (not (oddp (car lst))) Nil )
        ( t  (allOddp (cdr lst)))
    )
)

; 11. Написать рекурсивную функцию, относящуюся к хвостовой рекурсии с одним тестом завершения, 
; которая возвращает последний элемент списка - аргументы.

(defun lastEl (lst)
    (if (null (cdr lst))
        (car lst)
        (lastEl (cdr lst))
    )
)

; 12. Написать рекурсивную функцию, относящуюся к дополняемой рекурсии с
; одним тестом завершения, которая вычисляет сумму всех чисел от 0 до n-ого аргумента функции.
; Вариант: 1) от п-аргумента функции до последнего >= 0,
; 2) от п-аргумента функции до т-аргумента с шагом d.

(defun goToN(lst n)
    (cond
        ( (or (< n 0) (> n (length lst)) 
                (null (car lst))) (list 0) )
        ( (= n 0) lst )
        ( t (goToN (cdr lst) (- n 1)))
    )
)

(defun getNsum1Helper (lst)
    (if (null (car lst)) 
        0
        (+ (car lst) (getNsum1Helper (cdr lst)))
    )
)

(defun getNsum1 (lst n)
    (getNsum1Helper (goToN lst n))
)


(defun goToN(lst n)
    (cond
        ( (or (< n 0) (> n (length lst)) 
                (null (car lst))) (list 0) )
        ( (= n 0) lst )
        ( t (goToN (cdr lst) (- n 1)))
    )
)

(defun getNsum2Helper (lst n tt d result)
    (cond
        ( (or (null (car lst)) (>= n tt)) result)
        (t (getNsum2Helper (goToN lst d) (+ n d) tt d (+ result (car lst))))
    )
)

(defun getNsum2 (lst n tt d)
    (getNsum2Helper (goToN lst n) n tt d 0)
)


; 13. Написать рекурсивную функцию, которая возвращает последнее нечетное
; число из числового списка, возможно создавая некоторые вспомогательные функции.

(defun lastOddpNumHelper (lst val)
    (cond
        ( (null (car lst)) val)
        ( (oddp (car lst)) 
                (lastOddpNumHelper (cdr lst) (car lst)) )
        ( t (lastOddpNumHelper (cdr lst) val) )
    )
)

(defun lastOddpNum (lst)
    (lastOddpNumHelper lst Nil)
)

; 14. Используя cons-дополняемую рекурсию с одним тестом завершения,
; написать функцию которая получает как аргумент список чисел, 
; а возвращает список квадратов этих чисел в том же порядке.

(defun getPowerNumsHelper (lst)
    (
        cons (* (car lst) (car lst))
            (if (> (length (cdr lst)) 0)
                (getPowerNums (cdr lst))
                nil
            )
    )
)

(defun getPowerNums (lst)
    (if (null lst)
        Nil
        (getPowerNumsHelper lst)
    )
)

; 15. Написать функцию с именем select-odd, которая из заданного
; списка выбирает все нечетные числа. (Вариант 1: select-even,
; вариант 2: вычисляет сумму всех нечетных чисел(sum-all-odd) или 
; сумму всех четных чисел (sum-all-even) из заданного списка. )

; var1
(defun getNextOddp (lst)
    (cond 
        ( (null (car lst)) Nil )
        ( (oddp (car lst)) (getListOdd lst) )
        ( t (getNextOddp (cdr lst)) )
    )
)

(defun getListOdd (lst)
    (
        cons (car lst)
            (if (> (length (cdr lst)) 0)
                (getNextOddp (cdr lst))
                nil
            )
    )
)

(defun select-odd (lst)
    (getListOdd (getNextOddp lst))
)


; var2

(defun getNextOddp (lst sum)
    (cond 
        ( (or (null lst) (null (car lst))) nil )
        ( (oddp (car lst)) lst)
        ( t (getNextOddp (cdr lst) sum) )
    )
)

(defun getListOdd (lst sum)
    (cond
        ( (or (null lst) (null (car lst))) sum )
        ( (oddp (car lst)) 
                (getListOdd (cdr lst) (+ sum (car lst))) )
        ( t (getListOdd (getNextOddp (cdr lst) sum) sum) )
    )
)

(defun sum-all-even (lst)
    (getListOdd lst 0)
)
; Реализовать с помощью хвостовой рекурсии