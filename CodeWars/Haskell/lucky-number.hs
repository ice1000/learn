module Codewars.LuckyNumberChecker where

isLucky :: Integer -> Bool
isLucky x = 0 == sum ((\x -> read [x] :: Int) <$> show x) `mod` 9
