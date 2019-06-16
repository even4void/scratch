(defpackage #:biostrings
  (:use #:cl)
  (:export #:hamming))

(in-package #:biostrings)

;; (defun str-to-list (s)
;;   (with-input-from-string (elt s) (list (read elt))))

;; (defun str-to-list (s)
;;   (coerce s 'list))


;; Extracted from the CL track at Exercism.io
(defun hamming (seq1 seq2)
  "Number of positional differences in two equal length dna strands."
  (when (= (length seq1) (length seq2))
    (count nil
           (map 'list #'char= seq1 seq2))))
