(import matchable)

(define (fizzbuzz? n)
  (match (list (remainder n 3) (remainder n 5))
    ((list 0 0) 'fizzbuzz)
    ((list 0 _) 'fizz)
    ((list _ 0) 'buzz)
    (else #f)))

(print (fizzbuzz? 3))
