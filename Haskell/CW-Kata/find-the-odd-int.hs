module Codewars.Kata.FindOdd where

import Data.List

findOddRec :: [Int] -> Int
findOddRec [a] = a
findOddRec (a : (b : c))
|a == b = findOddRec c
|a /= b = a
--

-- | Given a list, find the [Int] that appears an
--   odd number of times. The tests will always
--   provide such a number, and the list will
--   always contain at least one element.
findOdd :: [Int] -> Int
findOdd xs = findOddRec $ sort xs
--
