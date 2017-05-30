module Haskell.Codewars.LuckyNumbers where

filterLucky :: [Int] -> [Int]
filterLucky = filter (\x -> elem '7' $ show x)
