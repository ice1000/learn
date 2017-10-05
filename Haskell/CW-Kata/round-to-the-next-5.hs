module Codewars.Kata.Next5 where

roundToNext5 :: Int -> Int
roundToNext5 n = if 0 == n `mod` 5 then n else (* 5) (1 + div n 5)
