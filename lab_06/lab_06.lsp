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

(setq lst1 '(Rus Ukr Blr Kaz)))
(setq lst2 '(Moscow Kiev Minsk Astana))

(defun create_list(lst1 lst2) 
(list (cons (car lst1) (car lst2))
(cons (cadr lst1) (cadr lst2))
(cons (caddr lst1) (caddr lst2))
(cons (cadddr lst1) (cadddr lst2))))

(create_list lst1 lst2)



; how-alike из лекции
(defun how-alike (x y)
    (cond ((or ( = x y) (equal x y))
          (and (oddp x) (oddp y))
          (and (evenp x) (evenp y))
          (T 'difference))))

