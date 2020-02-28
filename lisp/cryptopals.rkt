#lang racket

;; Cryptopals crypto challenges
;; https://cryptopals.com

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

(define (split-pairs lst)
  (cond
    [(null? lst) lst]
    [(<= (length lst) 2) (cons lst '())]
    [else (cons (take lst 2) (split-pairs (cddr lst)))]))

(define aa (split-pairs (string->list a)))
(define bb (split-pairs (string->list b)))

; or
(bytes->list (hex-string->bytes a))

(define zip (lambda (x y) (map list x y)))
