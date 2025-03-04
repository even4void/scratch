;; use n < 0 to index from end and n > 0 from start of sequence
;; then define head and tail with n = +/- 5
(define (take n xs)
  (let loop ((n n) (xs xs) (ys '()))
    (if (or (zero? n) (null? xs))
        (reverse ys)
        (loop (- n 1) (cdr xs)
          (cons (car xs) ys)))))

(take 4 '(1 2 3 4 5))
