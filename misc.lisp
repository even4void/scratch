;; based on example from On Lisp
(defun scan (&rest args)
  (values (read-from-string
	    (concatenate 'string "#("
			 (apply #'read-line args)
			 ")"))))

(defun fread (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          collect line)))
