(defun range (&key (from 0))
  (let ((n from))
    (lambda ()
      (prog1
          n
        (incf n)))))

(defun take (n gen)
  (loop :repeat n
        :collect (funcall gen)))

(take 10 (range :from 10))
