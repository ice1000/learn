module Codewars.Exercise.Squares where

squares :: Integer -> Int -> [Integer]
squares x n = (x ^) <$> (2 ^) <$> [0 .. n - 1]
