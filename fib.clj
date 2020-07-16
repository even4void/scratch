;; Time-stamp: <2018-01-17 09:32:56 chl>

;; Clojure High Performance
;; Variations around the Fibonacci sequence using linear algorithms.
;; https://deque.blog/2017/06/01/clojure-high-performance-fibonacci/#more-22281


(set! *unchecked-math* true)
(set! *warn-on-reflection* true)

;; iterate: lazy sequence of values with a fucntion to computet he next element
(defn fib-iter
  [^long n]
  (let [next-fib (fn [[a b]] [b (+ a b)])
        fibs (iterate next-fib [0N 1N])]
    (first (nth fibs n))))

;; lazy sequence: no inermediary pairs, hence less dynamic allocations
(defn fib-lazy-seq
  [^long n]
  (letfn [(fibs [a b] (cons a (lazy-seq (fibs b (+ a b)))))]
    (nth (fibs 0N 1N) n)))

;; recur: tail recursive implementation
(defn fib-recur
  [^long n]
  (loop [curr 0N
         next 1N
         n n]
    (if-not (zero? n)
      (recur next (+ curr next) (dec n))
      curr)))

;; trampoline: mutual recursion without consuming stack
(defn fib-trampoline
  [^long n]
  (letfn [(fibs [curr next ^long n]
            (if-not (zero? n)
              #(fibs next (+ curr next) (dec n))
              curr))]
    (trampoline (fibs 0N 1N n))))

;; local vars: lexical scoping with getter and setter
(defn fib-local-vars
  [^long n]
  (with-local-vars [curr 0N
                    next 1N
                    iter n]
    (while (> @iter 0)
      (let [nnext (+ @curr @next)]
        (var-set curr @next)
        (var-set next nnext)
        (var-set iter (dec @iter))))
    @curr))

;; volatile bindings: use of volatile references
(defn fib-volatile
  [^long n]
  (let [curr (volatile! 0N)
        next (volatile! 1N)
        iter (volatile! n)]
    (while (> @iter 0)
      (let [nnext (+ @curr @next)]
        (vreset! curr @next)
        (vreset! next nnext)
        (vswap! iter dec)))
    @curr))


(defprotocol Advance
  (advance [this n]))

(deftype FiboType [^:unsynchronized-mutable curr
                   ^:unsynchronized-mutable next]
  Advance
  (advance [_ n]
    (loop [^long n n]
      (if-not (zero? n)
        (let [nnext (+ curr next)]
          (set! curr next)
          (set! next nnext)
          (recur (dec n)))))
    curr))

(defn fibo-with-type
  [^long n]
  (advance (FiboType. 0N 1N) n))



(defn fibo-recur-java-bigint
  [^long n]
  (loop [curr (BigInteger/valueOf 0)
         next (BigInteger/valueOf 1)
         n n]
    (if-not (zero? n)
      (recur next (.add curr next) (dec n))
      curr)))
