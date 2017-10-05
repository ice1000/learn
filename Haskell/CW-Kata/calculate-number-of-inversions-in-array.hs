module Codewars.Exercise.Inversions where

import Data.List

countInversions :: Ord a => [a] -> Int
countInversions = length . inv
  where inv xs = [(a,b) | (a:bs) <- tails xs, b <- bs, a > b]
--
