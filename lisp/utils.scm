;; Some helper functions for Euler, Exercism, etc.
;; Mostly taken from _Recueil de petits problèmes en Scheme_ and online
;; websites.
;; Time-stamp: <2019-08-10 20:04:46 chl>

(define (list->string lst)
  "Convert a list to a string."
  (let* ((new-len (length lst))
         (new-str (make-string new-len)))
    (let loop ((i 0)
               (l lst))
      (if (= i new-len)
          new-str
          (begin
            (string-set! new-str i (car l))
            (loop (+ i 1) (cdr l)))))))

(define (string->list str)
  "Convert a string to a list."
  (let ((len (string-length str)))
    (let loop ((i 0)
               (acc '()))
      (if (= i len)
          (reverse acc)
          (loop (+ i 1)
                (cons (string-ref str i)
                      acc))))))

(define (vector-append vec1 vec2)
  "Concatenate two vectors."
  (define (fill! dest write src read len)
    (let ((stop (+ read len)))
      (let loop ((r read)
                 (w write))
        (if (= r stop)
            dest
            (begin
              (vector-set! dest w (vector-ref src r))
              (loop (+ r 1) (+ w 1)))))))
  (let* ((len1 (vector-length vec1))
         (len2 (vector-length vec2))
         (len (+ len1 len2))
         (vec (make-vector len)))
    (fill! vec 0 vec1 0 len1)
    (fill! vec len1 vec2 0 len2)))
