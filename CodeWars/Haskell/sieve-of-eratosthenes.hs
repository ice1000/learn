module Sieve where

findPrime :: [Int] -> [Int]
findPrime []       = []
findPrime (x : xs) = x : (findPrime $ filter (\a -> a `mod` x /= 0) xs)

primes :: Int -> [Int]
primes n = findPrime [2 .. n]
