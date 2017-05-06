module Codewars.G964.Sumdigpow where

value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 89, 135, 175, 518, 598, 1306, 1676, 2427, 2646798]

sumDigPow :: Int -> Int -> [Int]
sumDigPow a b = takeWhile (<= b) (dropWhile (< a) value)

