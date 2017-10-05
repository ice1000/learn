module SumRecursively where

sumR :: [Int] -> Int
sumR [     ] = 0
sumR (a : b) = a + sumR b
