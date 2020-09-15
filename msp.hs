import Data.List

main =
  interact $
  unlines .
  zipWith (++) ["Case #" ++ show t ++ ": " | t <- [1 ..]] . f . tail . lines

f [] = []
f (_:_xs:_ys:s) = solve (map read $ words _xs) (map read $ words _ys) : f s

solve xs ys = show . sum $ zipWith (*) (sort xs) (reverse $ sort ys)
