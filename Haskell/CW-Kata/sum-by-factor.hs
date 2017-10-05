module Codewars.Kata.SumByFactors where

import Data.List

factors' :: Integral t => t -> [t]
factors' n
  |n <= 0 = factors' (-n)
  |n >  0 = if 1 == n
            then []
            else let fac = mfac n 2 in fac : factors' (n `div` fac)
  where mfac m x
          | rem m x == 0   = x
          | x * x > m      = m
          | otherwise      = mfac m (if odd x then x+2 else x+1)
--

sumOfDivided :: [Integer] -> [(Integer, Integer)]
sumOfDivided xs = sort $ (\x -> (x, sum [ o | o <- xs, f1 o x])) <$> f xs
  where f n = nub $ n >>= factors'
        f1 n m = 0 == mod n m
--

