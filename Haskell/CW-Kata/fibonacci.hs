module Fibonacci where

fibonacci :: Int -> [Int]
fibonacci 0 = [0, 0]
fibonacci 1 = [1, 0]
fibonacci 2 = [1, 1]
fibonacci 3 = [2, 1]
fibonacci n = [sum m, m !! 0]
          where m = fibonacci (n - 1)
--

fib :: Int -> Int
fib n|n >= 0 || (mod n 2) == 0 = fibonacci n !! 0
     |otherwise                = 0 - (fibonacci (0 - n) !! 0)
--
