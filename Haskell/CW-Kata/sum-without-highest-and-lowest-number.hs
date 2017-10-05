module Kata where

sumArray :: Maybe [Int] -> Int
sumArray Nothing = 0
sumArray (Just []) = 0
sumArray (Just [_]) = 0
-- no div fuck
sumArray (Just xs) = (sum xs) - (maximum xs) - (minimum xs)
