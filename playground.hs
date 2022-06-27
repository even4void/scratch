f :: Int -> Int -> Int
f x y = x * x + y * y

-- main = print (f 2.3 4.2)

-- version 1
evenSum :: [Integer] -> Integer
evenSum l = accumSum 0 l
accumSum n l = if l == []
  then n
  else
    let x  = head l
        xs = tail l
    in  if even x then accumSum (n + x) xs else accumSum n xs

-- version 2
evenSum :: Integral a => [a] -> a
evenSum = accumSum 0
 where
  accumSum n []       = n
  accumSum n (x : xs) = if even x then accumSum (n + x) xs else accumSum n xs

-- version 3
import Data.List (foldl')
sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0
evenSum :: Integral a => [a] -> a
evenSum = sum' . (filter even)
