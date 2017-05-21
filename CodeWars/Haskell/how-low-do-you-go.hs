module Kata (lowest) where

lowest :: [[Int]] -> [Int]
lowest arr = minimum <$> arr
