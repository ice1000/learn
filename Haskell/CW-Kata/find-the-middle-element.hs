module Codewars.Kata.Middle where

-- | Return the index of the middle element.
--   The first element has index 0.
gimme :: Ord a => (a, a, a) -> Int
gimme (a, b, c)
  |a > b && a < c = 0
  |a < b && a > c = 0
  |a > b && c < b = 1
  |a < b && c > b = 1
  |b > c && a < c = 2
  |b < c && a > c = 2
--
