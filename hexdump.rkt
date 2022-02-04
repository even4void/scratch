#lang racket

(require file/sha1)

(define stride 48)

(define (dump v)
  (for ([i (in-range 0 (bytes-length v) stride)])
    (define l (subbytes v i (min (+ stride i) (bytes-length v))))
    (displayln (bytes->hex-string l))))

(module+ main
  (require racket/cmdline)
  (command-line #:args (f)
                (dump (file->bytes f))))
