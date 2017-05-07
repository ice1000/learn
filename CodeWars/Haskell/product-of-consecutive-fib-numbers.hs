module Codewars.Kata.Fib where

find :: Integer -> [Integer] -> [Integer]
find n m|product m >= n = m
        |otherwise      = find n [sum m, m !! 0]
--

-- | Returns a pair of consecutive Fibonacci numbers a b,
--   where (a*b) is equal to the input, or proofs that the
--   number isn't a product of two consecutive Fibonacci 
--   numbers.
productFib :: Integer -> (Integer, Integer, Bool)
productFib n = (k !! 1, k !! 0, product k == n)
           where k = find n [1, 0]
--
