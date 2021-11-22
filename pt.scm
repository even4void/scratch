(import (chicken foreign))

(foreign-declare "#include <gsl/gsl_sf_gamma.h>")

(define beta-incomplete
  (foreign-lambda double "gsl_sf_beta_inc" double double double))

(define (pt t df)
  (let ((a (* 0.5 beta-incomplete (* 0.5 dof) 0.5 (/ dof (+ dof (square t-statistic))))))
    beta))

(display (pt 2.41 36))
