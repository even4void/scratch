#lang racket

(require math/number-theory)

(define (rev-string str)
  (list->string (reverse (string->list str))))

(define (palindrome? x)
    (equal? (number->string x) (rev-string (number->string x))))

(for ([x (in-range 1 1e6)])
     (when (and (palindrome? x) (prime? x))
       (display (format "~a " x))))
