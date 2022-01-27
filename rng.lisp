(defun box-muller ()
  (loop
    for x1 = (1- (* 2.0d0 (random 1d0)))
    for x2 = (1- (* 2.0d0 (random 1d0)))
    for w = (+ (* x1 x1) (* x2 x2))
    while (>= w 1d0)
    finally
    (let ((w (sqrt (/ (* -2d0 (log w)) w))))
          (return (values (* x1 w) (* x2 w))))))

(defun rnorm (mean std)
  (+ (* (box-muller) std) mean))

(defun take (n gen)
  (loop :repeat n
        :collect (funcall gen)))

(take 100 (rnorm 10 2))
