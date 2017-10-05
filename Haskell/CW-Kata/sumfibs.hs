module Codewars.Fibonacci where

fibs = 0 : 1 : (zipWith (+) fibs $ tail fibs)

sumFibs :: Int -> Integer
sumFibs n = sum $ filter even $ take (n + 1) fibs
