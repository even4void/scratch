;loaded from gist: https://gist.github.com/viebel/b133efde8669d6c0630ee6895c1797c6
(defn choice [a b]
  (clojure.string/join (or (seq a) (seq b))))

(defn fizzbuzz [n]
  (let [fizzes (cycle ["" "" "Fizz"])
        buzzes (cycle ["" "" "" "" "Buzz"])
        words (map str fizzes buzzes)
        numbers (map str (rest (range)))]
    (take n (map max words numbers))))
