(define (digits n acc)
  (if (< n 10)
    (+ acc 1)
    (digits (/ n 10) (+ acc 1))))

(define-syntax-rule (while condition body ...)
  (let loop ()
    (when condition
      body ...
      (loop))))
