module PrimeNumber where

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime k = null [ x | x <- [2 .. (1 + (floor $ sqrt $ fromIntegral k))], k `mod` x  == 0 ]
