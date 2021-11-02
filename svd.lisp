(ql:quickload "magicl")

;; https://github.com/quil-lang/magicl/issues/135
(setf *read-default-float-format* 'double-float)

(defparameter *a* (magicl:from-list '(3.0 2.0  2.0
                                      2.0 3.0 -2.0)
                                    '(2 3)))

;; return U, Sigma and V^t
(magicl:svd *a*)

;; Expected result:
;; {\pmatrix {1/\sqrt{2} & 1/\sqrt{2} \\ 1/\sqrt{2} & -1/\sqrt{2}}}
;; {\pmatrix {5 & 0 & 0 \\ 0 & 3 & 0}}
;; {\pmatrix {1/\sqrt{2} & 1/\sqrt{2} & 0 \\ 1/\sqrt{18} & -1/\sqrt{18} & 4/\sqrt{18} \\ 2/3 & -2/3 & -1/3 }}
