-- https://doisinkidney.com/snippets/drawing-trees.html
module TreeDrawing where

import Data.Tree (Tree(..))
import Data.List (intercalate)

drawTree :: Tree String -> String
drawTree tr = (unlines . filter content . flatten) (foldr go undefined maxLengths withLength)
  where
    withLength = fmap (\x -> (length x, x)) tr
    maxLengths = lwe withLength (repeat 0)
    lwe (Node x xs) (q:qs) = max (fst x) q : foldr lwe qs xs
    
    content = any (`notElem` " │")
    flatten (ls,x,rs) = ls ++ [x] ++ rs
    mapZipper lf f rf (ls,x,rs) = (map lf ls, f x, map rf rs)
    toZipper xs = case splitAt (length xs `div` 2) xs of (ls,x:rs) -> (ls,x,rs)
    
    go m ls (Node (l,x) []) = ([],replicate (m-l) '─' ++ x,[])
    go m ls (Node (l,x) [y]) = mapZipper pad link pad (ls y)
      where
        padding = m + 1
        pad = (++) (replicate padding ' ')
        link z = replicate (m-l) '─' ++ x ++ "─" ++ z
    go m ls (Node (l,x') xs) = mapZipper pad link pad (toZipper (intercalate ["│"] ([ysh] ++ ysm ++ [ysl])))
      where 
        x = replicate (m-l) '─' ++ x'
        ys = map ls xs
        
        ysh = flatten (mapZipper (' ':) ('┌' :) ('│':) (head ys))
        ysl = flatten (mapZipper ('│':) ('└' :) (' ':) (last ys))
        ysm = map (flatten . mapZipper ('│':) ('├':) ('│':)) (init (tail ys))
        
        pad = (++) (replicate m ' ')
        
        link ('│':zs) = x ++ "┤" ++ zs
        link ('├':zs) = x ++ "┼" ++ zs
        link ('┌':zs) = x ++ "┬" ++ zs
        link ('└':zs) = x ++ "┴" ++ zs
