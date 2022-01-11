;; Illustration for a blog post
(defun power-set (lst)
  (if (eq nil lst) '(())
      (let ((power-set-cdr (power-set (cdr lst))))
        (append power-set-cdr
                (mapcar #'(lambda (subset) (cons (car lst) subset))
                     power-set-cdr)))))

(defun randu (lst)
  (let ((r (random (length lst))))
    (nth r lst)))

(defun repeat (f n)
  (dotimes (i n) (funcall f)))

(defparameter *set* '(#\e #\a #\s #\i #\n #\t #\c #\p))
;; (defvar data (repeat (randu *set*) 6))

(mapcar #'(lambda (x) (format nil "~{~a~}" x)) (power-set *set*))


