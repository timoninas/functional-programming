
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