#!/usr/bin/env bash
"exec" "clj" "-Sdeps" "{:deps {org.clojure/math.combinatorics {:mvn/version \"0.1.6\"}}}" "-M" "$0" "$@"

(ns foo
  (:use [clojure.math.combinatorics :only (permutations)]))

(dorun (map #(println (apply str %)) (permutations "abcde")))

