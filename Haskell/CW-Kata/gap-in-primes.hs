module Codewars.G964.GapInPrimes where

import Data.List

isPrime :: Integer -> Bool
isPrime k = null [ x | x <- [2 .. (floor $ sqrt $ fromInteger k)], k `mod` x  == 0 ]

gap :: Integer -> Integer -> Integer -> Maybe (Integer, Integer)
gap g m n = let ls = [ a | a <- [m .. n], isPrime a ] in
   find (\(x, y) -> y - x == g) $ zip ls $ tail ls
--
