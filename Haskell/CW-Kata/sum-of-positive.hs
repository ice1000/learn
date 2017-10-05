module Codewars.Arrays where

positiveSum :: [Int] -> Int
positiveSum as = sum [ a | a <- as, a > 0 ]
