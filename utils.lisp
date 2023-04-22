(defun first-n (n list)
  (butlast list (- (list-length list) n)))

(defun duplicates (lst)
  (cond ((null lst) '())
        ((member (car lst) (cdr lst)) (cons (car lst) (duplicates (cdr lst))))
        (t (duplicates (cdr lst)))))

