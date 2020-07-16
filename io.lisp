;; Various helper functions to process biological data files
;;

;; FASTA files
(defun fasta (pathname)
  (with-open-file (s pathname)
    (loop for line = (read-line s nil)
          while line
          do (if (char= #\> (char line 0))
                 (format t "~&~A: " (subseq line 1))  ; FIXME replace with collect
                 (princ line))
          finally (fresh-line))))


;; (alexandria:read-file-into-string "file.txt")
;; (split-sequence:split-sequence #\Newline *)


;; tabular data
;; See https://stackoverflow.com/q/30591000 for CSV files
(defun collect-table (stream numcols)
  (cons (loop repeat numcols collect (read stream))
        (loop while (peek-char t stream nil nil)
              collect (loop repeat numcols collect (read stream)))))

(defun read-table (file numcols)
  (with-open-file (stream file)
    (collect-table stream numcols)))
