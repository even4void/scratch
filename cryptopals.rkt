#lang racket

;; Cryptopals crypto challenges
;; https://cryptopals.com

;; -----
;; Set 1
;; -----

;; Problem 1
;; We need something like Python's unhexlify or ''.decode("hex").
(require file/sha1)
(require net/base64)

(define s "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")

(base64-encode (hex-string->bytes s))

;; Problem 2
;; We need to "xor" the integer value of each character and return the character string
;; corresponding to the ASCII code.
;;
;; (define curr (bitwise-xor #x1C #x68))
;; (bytes->hex-string (integer->integer-bytes curr 1 #t))
(define a "1c0111001f010100061a024b53535009181c")
(define b "686974207468652062756c6c277320657965")

(define (split-pairs lst)
  (cond
    [(null? lst) lst]
    [(<= (length lst) 2) (cons lst '())]
    [else (cons (take lst 2) (split-pairs (cddr lst)))]))

(define aa (split-pairs (string->list a)))
(define bb (split-pairs (string->list b)))


(define hx1 (hex-string->bytes (list->string (car aa))))
(define hx2 (hex-string->bytes (list->string (car bb))))
(define curr (bitwise-xor hx1 hx2))
(bytes->hex-string (integer->integer-bytes curr 1 #t))

(define zip (lambda (x y) (map list x y)))
