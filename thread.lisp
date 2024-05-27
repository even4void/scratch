(defmacro ->> (var &rest lst)
  (if (car lst)
    `(->> (,@(car lst) ,var) ,@(cdr lst))
    `,var))

(defvar *out* (->> 1
                   (+ 2)))
(print *out*)
