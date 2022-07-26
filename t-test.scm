(import (chicken foreign))

(foreign-declare "#include <gsl/gsl_sf_gamma.h>")

(define beta-incomplete
  (foreign-lambda double "gsl_sf_beta_inc" double double double))

(define (p-value stat df two-sided)
  (set! stat (exact->inexact stat))
  (set! df (exact->inexact df))
  (let ((a (beta-incomplete (* 0.5 df) 0.5 (/ df (+ df (* stat stat))))))
    (if (two-sided a)
      (if (positive? stat)
        (* 0.5 a)
        (- 1.0 (* 0.5 a))))))

(define (t-test x1 s1 n1 x2 s2 n2 two-sided)
  (let ((stat #f)
        (df #f))
    (let ((s (sqrt (/ (+ (* (- n1 1) (* s1 s1)
                            (* (- n2 1) (* s2 s2))))
                      (+ n1 n2 -2)))))
      (set! stat (/ (- x1 x2
                       (* s (sqrt (+ (/ n1) (/ n2)))))))
      (set! df (+ n1 n2 -2)))
    (p-value stat df two-sided)))

;; test
(t-test 12 2 24 11 1.5 24 #t)
