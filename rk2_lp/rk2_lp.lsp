
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

(defun F (x l)
    (if l
        (if (equal x 0) 
            (F (- x 1) (cdr l))
            (cons (car l) (F (- x 1) (cdr l))))
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

