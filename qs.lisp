;; Short quicksort function, by David Johnson-Davies
;; http://www.lispology.com/show?39XI

(defun quicksort (lis)
  (when lis
    (destructuring-bind (p . r) lis
      (flet ((less (x) (< x p)))
        (append (quicksort (remove-if-not #'less r))
                (list p)
                (quicksort (remove-if #'less r)))))))

(quicksort '(3 1 4 1 5 9 2 6 5 3 5 8))
