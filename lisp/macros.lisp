
;; To mimic Scheme (define ...)
(defmacro define ((name &rest args) &body body)
  `(defun ,name ,args ,@body))

;; Example of use from SICP
(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-count)))

(define (factorial n)
    (fact-iter 1 1 n))

(factorial 1000)
