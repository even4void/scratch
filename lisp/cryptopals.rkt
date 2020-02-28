#lang racket

;; -----
;; Set 1
;; -----

;; Problem 1
(require file/sha1)
(require net/base64)

(define s "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")

(base64-encode (hex-string->bytes s))

;; Problem 2
(define a "1c0111001f010100061a024b53535009181c")
(define b "686974207468652062756c6c277320657965")

(define zip (lambda (x y) (map list x y)))
