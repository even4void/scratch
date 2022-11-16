max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (<= x) xs) ++ [x] ++ quicksort (filter (> x) xs)
