#lang racket
(let loop ([m #t])
  (when m
    (when (regexp-try-match #rx"^>" (current-input-port))
      (unless (eq? #t m) (newline))
      (printf "~a: " (read-line)))
    (loop (regexp-match #rx"\n" (current-input-port) 0 #f
                        (current-output-port)))))
(newline)


(define (read-fasta port)
  (let ((titre (read-line port)))
    (if (or (eof-object? titre)
            (zero? (string-length titre))
            (not (char=? (string-ref titre 0)
                         #\>)))
        (error 'read-fasta "not a fasta file" port)
        (let loop ((str ""))
          (let ((lu (read-line port)))
            (if (or (eof-object? lu)
                    (char=? #\> (string-ref lu 0)))
                (cons titre str)
                (begin (print lu)
                       (loop (string-append str lu)))))))))
