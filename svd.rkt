#lang racket
(require flomat csv-reading)

(define (import file)
  (csv->list ((make-csv-reader-maker
               '((separator-chars #\,)
                 (quote-char . #f))) (open-input-file file))))

(define data (map (lambda (xs) (map string->number xs)) (cdr (import "/home/chl/tmp/birthwt.csv"))))
(define xs (matrix (map (lambda (xs) (list-ref xs 1)) data)))
(define ys (matrix (map (lambda (xs) (list-ref xs 9)) data)))

(define X (augment xs (flomat-ones (nrows xs) 1)))
(define-values (U S V) (svd X))
;; Note that the above procedure return a full matrix (n x n) for U
(times V (inv (diag S)) (transpose (sub U 0 0 (nrows U) 2)) ys)
