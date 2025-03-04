-- https://doisinkidney.com/snippets/partitions.html
module Partitions where

import Data.Foldable

-- | >>> partitions "abc"
partitions :: [a] -> [[[a]]]
partitions = foldrM f [] where
  f x xs = go id xs where
    go k [] = [[x] : k []]
    go k (y:ys) = ((x:y) : k ys) : go (k . (:) y) ys

