


(defun f5_1 (ar1 ar2 ar3 ar4) `((,ar1 ,ar2)(,ar3 ,ar4)))
(defun f5_2 (ar1 ar2 ar3 ar4) (list (list ar1 ar2) (list ar3 ar4)))
(defun f5_3 (ar1 ar2 ar3 ar4) (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil))  nil)))

(defun f6_1 (ar1 ar2) `((,ar1)(,ar2)))
(defun f6_2 (ar1 ar2) (list (list ar1) (list ar2)))
(defun f6_3 (ar1 ar2) (cons (cons ar1 nil) (cons (cons ar2 nil) nil)))

(defun f7_1 (ar1) `(((,ar1))))
(defun f7_2 (ar1) (list (list (list ar1))))
(defun f7_3 (ar1) (cons (cons (cons ar1 nil) nil) nil))
