;;; SICP (part of) in Common Lisp (SBCL 2.0.2, march 2020)
;;; Time-stamp: <2020-03-24 12:31:50 chl>

;;; Section 1

(defun square (x) (* x x))

(defun sum-of-squares (x y)
  (+ (square x) (square y)))

(defun abs (x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(defun abs-v2 (x)
  (cond ((< x 0) (- x))
        (t x)))

(defun abs-v3 (x)
  (if (< x 0) (- x) x))
