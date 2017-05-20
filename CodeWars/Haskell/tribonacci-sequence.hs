module Tribonacci where

tribonacci :: Num a => (a, a, a) -> Int -> [a]
tribonacci (a, b, c) n = let ret = a : b : c : (zipWith3 f ret (tail ret) $ tail $ tail ret) in take n ret
  where f = \a b c -> a + b + c
--
