
; Вставка k-го элемента
(defun insert-k (lst value k)
    (cond
        ( (< k 1) (cons value lst))
        ( t (cons (car lst) (insert-k (cdr lst) value (- k 1))) )
    )
)

; Многоуровневый список в одноуровневый
;(getOneLst (list 1 2 (list 3 4 5) 6 (list 7 8 9 'A) ) nil) ->
;       -> (1 2 3 4 5 6 7 8 9 A)

(defun getOneLst (lst newlst)
	(cond ((null lst) newlst)
          ((atom lst) (cons lst newlst))
		  (t (getOneLst (car lst) (getOneLst (cdr lst) newlst) ))
    )
)


; Удаляет i-ый элемент в списке

(defun remove-i (i lst)
    (setq i (1+ i)) ;setq НЕ убирать и не менять на set
    (remove-if #'(lambda (x) (zerop (setq i (1- i)))) lst)
)

(defun remove-i (i lst)
    (if lst
        (if (equal i 0) 
            (remove-i (- i 1) (cdr lst))
            (cons (car lst) (remove-i (- i 1) (cdr lst))))
        nil
    )
)

; Вставка на i-е место элемента

; Из внутреннего списка вставляет все значения на position в основном списке
(defun insert(lst newElement position)
    (cond 
        ( (null lst) (append newElement NIL) )
        ( (> position 0) (cons (car lst) (insert (cdr lst) newElement (- position 1))) )
        ( T (append newElement lst))
  )
)




; Вставка элемента в конец списка

; Вставить в конец списка список не сработает
(defun append1 (lst number)
    (cons 
        (if (not (null lst))
            (car lst)
        )

        (cond
            ((< (length (cdr lst)) 1) (cons number nil))
            (t (append1 (cdr lst) number))
        )
    )
)
