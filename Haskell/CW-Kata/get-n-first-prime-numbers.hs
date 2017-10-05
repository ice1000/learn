module PrimeNumbers where

primes :: [Int]
primes = sieve [2 ..]
  where
    sieve (p : xs) = p : sieve [ x | x <- xs, x `mod` p > 0 ]
--

getPrimes :: Int -> [Int]
getPrimes n = take n primes
