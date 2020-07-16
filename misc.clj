;; Scratch notebook used when I was reading 4clojure.com
;; Time-stamp: <2019-08-23 13:34:05 chl>

(map #(+ % 5) '(1 2 3))
;; => '(6 7 8)

(filter #(> % 5) '(3 4 5 6 7))
;; => '(6 7)

(filter odd? '(1 2 3 4 5))
;; => '(1 3 5)

;; same as nth
(fn [coll n] (first (drop n coll)))

;; same as reverse
(reduce conj () (range 5))

;; sum of all items in a list
(reduce + (range 1 5))

;; Fibonacci numbers
(defn fib [n]
  (if (< n 2) 1 
      (+ (fib (dec (dec n)))
         (fib (dec n)))))

(def memo-fib (memoize fib))

