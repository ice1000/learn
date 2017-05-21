module Kata where

smallEnough :: [Int] -> Int -> Bool
smallEnough xs v = all (<= v) xs
