module Piles where

fourPiles :: Int -> Int -> [Int]
fourPiles n y' = let x = floor ((fromIntegral n) / (y + 2 + 1 / y)) in
  if 0 /= mod x y' || x == y' then [] else [x + y', x - y', x * y', div x y']
  where y = (fromIntegral y' :: Float)
--
