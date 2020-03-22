; 9. Переписать функцию how-alike, приведенную в лекции и не пользующую COND, 
; используя конструкция IF, AND/OR.

(defun how-alike (x y)
    (if (or ( = x y) (equal x y))
            'sameNumbers
            (if (and (oddp x) (oddp y))
                'oddpNumbers
                (if (and (evenp x) (evenp y))
                    'evenpNumbers
                    'differenceNumbers
                )
            )   
    )
)

; 10. (было дано дополнительно): Дано два списка: название стран (4 шт) и список столиц.
; Создать а) список из двухэлементных списков 
;         б) список точечных пар.
; По созданным спискам: 1 - по столице найти страну 2 - по стране найти столицу



; how-alike из лекции
(defun how-alike (x y)
    (cond ((or ( = x y) (equal x y))
          (and (oddp x) (oddp y))
          (and (evenp x) (evenp y))
          (T 'difference))))

