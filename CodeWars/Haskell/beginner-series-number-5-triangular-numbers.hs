module Codewars.Numbers where

isTriangular :: Int -> Bool
isTriangular t = f t 1
  where f a b
          |a <= 0    = False
          |1 == a    = True
          |otherwise = f (a - b - 1) (b + 1)
  --
