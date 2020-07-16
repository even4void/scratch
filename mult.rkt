;; Fast multiplication of large integers using Karatsuba algorithm.
;; Adapted from https://www.nayuki.io/page/karatsuba-multiplication,
;; with Python code available on Github.
#lang racket

(define *up* 1536)

(define (mult x y)
  (if (or (<= (integer-length x) *up*) (<= (integer-length y) *up*))
      (* x y)
      (let* ([n (max (integer-length x) (integer-length y))]
             [mid (* (floor (/ (+ n 32) 64)) 32)]
             [mask (- (arithmetic-shift 1 mid) 1)]
             [xlow (bitwise-and x mask)]
             [ylow (bitwise-and y mask)]
             [xhigh (arithmetic-shift x (- mid))]
             [yhigh (arithmetic-shift y (- mid))]
             [a (mult xhigh yhigh)]
             [b (mult (+ xlow xhigh) (+ ylow yhigh))]
             [c (mult (xlow ylow))]
             [d (- b a c)])
        (+ (arithmetic-shift (+ (arithmetic-shift a mid) d) mid) c))))


;; Other variations
(define (mult-a x y)
  (if (= y 0)
      0
      (+ x (mult-a x (- y 1)))))

(define (mult-b x y)
  (cond [(= y 0) 0]
        [(even? y) (mult-b (* x 2) (/ y 2))]
        [else (+ x (mult-b x (- y 1)))]))
