module Codewars.Kata.Combos where

combos :: Int -> [[Int]]
combos n = f 1 n
  where f u n = if u <= n then [n] : ([u .. n] >>= \x -> (x :) <$> f x (n - x)) else []
--
