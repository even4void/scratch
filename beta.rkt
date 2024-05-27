#lang racket

(require math/special-functions)
(require plot)

(plot-new-window? #t)

(define (dbeta alpha beta x)
  (let ([scale (/ (* (gamma alpha) (gamma beta))
                  (gamma (+ alpha beta)))])
    (/ (* (expt x (sub1 alpha)) (expt (- 1 x) (sub1 beta)))
       scale)))

(define (dbeta- alpha beta x)
  (dbeta alpha beta (- 1 x)))

(define theta (/ 1 5))

(plot (list (function (curry dbeta- .9 .1) 0.0001 .9999 #:label "Prior (.9, .1)")
            (function (curry dbeta- 4.9 1.1) 0.0001 .9999 #:color "blue" #:label "Posterior (4.9, 1.1)")
            (points (list (list theta 0)) #:label "θ (ML)" #:size 10))
      #:title "Prior and Posterior θ distribution"
      #:width 800 #:height 600 #:x-label "θ" #:y-label "Probability mass"
      #:out-file "beta.png")
