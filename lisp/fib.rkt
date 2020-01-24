#lang racket

(require memoize)
(require racket/trace)

(define (fib0 n)
  (if (<= n 1) 1 (+ (fib0 (- n 1)) (fib0 (- n 2)))))

(define/memo (fib n)
  (if (<= n 1) 1 (+ (fib (- n 1)) (fib (- n 2)))))

(trace fib)
(fib 10)
