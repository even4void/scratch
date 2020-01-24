#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer isquare-define (ffi-lib "isquare"))

(isquare-define isquare (_fun _int -> _int))

(isquare 5)
