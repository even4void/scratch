;; Source: https://kaygun.tumblr.com/post/55714055393/a-gradient-descent-implementation-in-lisp

(defun norm (x)
   (sqrt (reduce '+ (map 'vector (lambda (i) (expt i 2)) x))))

(defun nabla (f x v &optional (epsilon 1.0d-4))
   (let* ((dir (map 'vector (lambda (u) (* epsilon u)) v))
          (ter (map 'vector '+ x dir))
          (ini (map 'vector '- x dir)))
      (/ (- (funcall f ter)
            (funcall f ini))
         (* 2 (norm dir)))))

;; f(x,y) = x^2 + y^2 and its partial derivative at (0,0)

(defun f (v)
   (reduce '+ (map 'vector (lambda (i) (expt i 2)) v)))

(cons (nabla 'f #(0 0) #(0 1)) (nabla 'f #(0 0) #(1 0)))

(defun range (n &optional (ini 0) (step 1))
   (loop for i from ini to n by step collect i))

(defun basis (i n)
   (map 'vector (lambda (j) (if (equal i j) 1 0)) (range n)))

(mapcar (lambda (i) (norm (basis i 10))) (range 10))

(defun descent (fun x &key (error 1.0d-5)
                           (rate 1.0d-2)
                           (max-steps 10000))
  (let ((len (length x)))
     (do* ((y x (map 'vector '- y step))
           (step (map 'vector
                      (lambda (i) (* rate (nabla fun y (basis i len))))
                      (range len))
                 (map 'vector
                      (lambda (i) (* rate (nabla fun y (basis i len))))
                      (range len)))
           (n 0 (1+ n)))
          ((or (< (norm step) error)
               (>= n max-steps))
           (if (< n max-steps) y)))))

(let ((result (descent 'f #(1.0 1.0) :rate 3.3d-2)))
  (format nil "~%    We found a local extremum at x=~3,3F y=~3,3F~%" (aref result 0) (aref result 1)))

;; g(x,y,z) = sin(x/2) cos(y) + x^2
(defun g(x) (+ (* (sin (* 0.5 (aref x 0))) (cos (aref x 1))) (expt (aref x 2) 2)))

(let ((result (descent 'g #(-1.2 -0.2 0.9) :rate 2.3d-2 :error 1.d-6)))
  (format nil "~%    We found a local extremum at x=~3,3F y=~3,3F z=~3,3F~%"
              (aref result 0)
              (aref result 1)
              (aref result 2)))

;; OLS fit
(defvar a (- (random 8.6) 4.3))
(defvar b (- (random 6.8) 3.4))

(defvar mydata
   (map 'vector
        (lambda (x) (coerce (list x (+ b (* a x) (- (random 0.8) 0.4)))
                            'vector))
        (loop for i from 1 to 520 collect (random 2.0))))

(defun lse (raw-data &optional (sample-size 0.05))
   (let* ((n (length raw-data))
          (m (floor (* n sample-size)))
          (subset (loop for z from 1 to m
                        collect (aref raw-data (random n)))))
       (lambda (x) (/ (reduce '+
                              (map 'list
                                   (lambda (i) (expt (+ (aref x 1)
                                                        (* (aref x 0)
                                                           (aref i 0))
                                                        (- 0 (aref i 1)))
                                               2))
                                   subset))
                      (* 2 m)))))

(defvar myerr (lse mydata 0.08))

(let ((result (descent myerr #(-2.2 -1.2))))
  (format nil "~%    We found the best fitting line at a=~3,3F b=~3,3F
The original values were: a=~3,3F and b=~3,3F~%"
              (aref result 0)
              (aref result 1)
              a
              b))

