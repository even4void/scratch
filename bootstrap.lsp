;; Toy example of bootstrap resampling using LispStat
;; 2021-11-02, https://aliquote.org/post/bootstraping-lisp/
(defun simulate (stat k fun)
  (let ((out ()))
    (dotimes (i k)
      (push (funcall stat (funcall fun))
            out))
    out))

(defun bootstrap (stat data b)
  (let ((n (length data))  )
    (simulate stat b
              #'(lambda () (sample data n t)))))

(simulate #'mean 20 #'(lambda () (normal-rand 25)))

(setf seed (make-random-state *random-state*))
(def x (normal-rand 100))
(def bs (bootstrap #'mean x 1000))
(histogram bs :title "1000 bootstrap samples")

