module Codewars.Kata.Unique where

import Data.List

findUniqueNumber :: [Int] -> Int
findUniqueNumber [a] = a
findUniqueNumber (a : (b : c))
  | a /= b    = a
  | otherwise = findUniqueNumber c
--

-- | All numbers in the unsorted list are present twice,
--   except the one you have to find.
findUnique :: [Int] -> Int
findUnique = findUniqueNumber . sort
--
