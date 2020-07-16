;;; basic-trees.lisp

;;; Basic manipulation of binary trees + some traversal algos.
;;; See CLRS, chapter 12 for detailed discussion on trees.
;;; cite:cormen-2009-introd-algor.pdf

(defstruct node
  value
  left
  right)

(defun tree (list)
  (cond
    ((null list) nil)
    ((atom list) (make-node :value list))
    ((listp list) (destructuring-bind (v l r) list
                    (make-node :value v
                               :left (tree l)
                               :right (tree r))))))


(defparameter *test*
  (tree '(a (b (c nil nil)
               (d (e nil nil)
                  (f nil nil)))
            (g nil
               (h (i nil nil)
                  nil)))))

(princ *test*)
