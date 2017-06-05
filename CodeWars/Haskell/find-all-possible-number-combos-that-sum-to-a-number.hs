module Codewars.Kata.Combos where

import Data.List

combos :: Int -> [[Int]]
combos 1 = [[1]]
combos n = f 1 n
  where f u n
          | u  <=  n = [n] : ([u .. n] >>= \x -> (x :) <$> f x (n - x))
          |otherwise = []
--
