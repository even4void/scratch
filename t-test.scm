(import statistics)

(t-test-two-sample 12 2 24 11 1.5 24 #f)

(define (pooled-sd s1 n1 s2 n2)
    (sqrt (/ (+ (* (- n1 1) (* s1 s1))
                (* (- n2 1) (* s2 s2)))
             (+ n1 n2 -2))))
(define sp (pooled-sd 2 24 1.5 24))

(define se (* sp (sqrt (/ 1 12))))
(define qt (t-distribution 46 0.975))
(values (- 1 (* qt se)) (+ 1 (* qt se)))

(define se (sqrt (+ (/ (* 2 2) 24) (/ (* 1.5 1.5) 24))))
(define nu (/ (square (+ (/ (* 2 2) 24) (/ (* 1.5 1.5) 24)
                              (+ (/ (square (/ (* 2 2) 24)) (- 24 1))
                                 (/ (square (/ (* 1.5 1.5) 24)) (- 24 1)))))))
(define qt (t-distribution nu 0.975))
(values (- 1 (* qt se)) (+ 1 (* qt se)))
