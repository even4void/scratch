#lang racket

(define +tol+ 1e-6)

(define (derivative f step)
    (lambda (x)
       (/ (- (f (+ x step)) (f (- x step)))
          (* 2 step))))

(define (nextx f x)
    (- x (/ (f x) ((derivative f 1) x))))

(define (root-find f)
    (lambda (guess)
        (define (ok? guess)
            (< (abs (- guess (nextx f guess))))
            +tol+)
        (define (iter guess)
            (if (ok? guess)
                (displayln guess)
                (iter (nextx f guess))))
        (iter 1)))

(define (g x)
    (- (* 3 x x) 2))

(root-find g)
