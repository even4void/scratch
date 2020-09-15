-- Time-stamp: <2020-09-14 11:00:40 chl>
-- Source: https://crypto.stanford.edu/~blynn/pr/jaynes.html
--
-- Expected output:
--
-- % stack ghci
--
-- λ> :l Hypergeo.hs
-- [1 of 1] Compiling Main             ( Hypergeo.hs, interpreted )
-- Ok, one module loaded.
-- λ> main
-- N = 100, M = 10, n = 50
--  0 0.000593 0.000593
--  1 0.007237 0.007830
--  2 0.037993 0.045824
--  3 0.113097 0.158920
--  4 0.211413 0.370333
--  5 0.259334 0.629667
--  6 0.211413 0.841080
--  7 0.113096 0.954177
--  8 0.037993 0.992170
--  9 0.007237 0.999407
-- 10 0.000593 1.000000
--
-- --%<-----(snip)----->%--
import Text.Printf

ch _ 0 = 1
ch n k = n * ch (n - 1) (k - 1) / fromIntegral k

f :: Float -> Float -> Int -> [String]
f nn mm n =
  (:) (printf "N = %.f, M = %.f, n = %d" nn mm n) $
  fst $
  foldl
    (\(x, t) r ->
       let h = (ch mm r) * (ch (nn - mm) (n - r)) / ch nn n
        in (x ++ [printf "%2d %.6f %.6f" r h (t + h)], t + h))
    ([], 0)
    [0 .. 10]

main =
  putStr . unlines $
  concat
    [ f 100 10 50 -- Table 3.1.
    , f 100 50 10 -- Table 3.2.
    , f 99 50 10 -- Table 3.3.
    ]
