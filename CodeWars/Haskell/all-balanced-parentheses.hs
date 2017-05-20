module Balanced.Parens where

solve :: Int -> Int -> [String]
solve _ 0    = []
solve 0 n    = ('(' :) <$> solve 1 (n - 1)
solve c n1
  |c < n     = (('(' :) <$> solve (c + 1) n)
   ++ ((')' :) <$> solve (c - 1) n)
  |otherwise = [take n [')', ')' ..]]
  where n = n1 - 1
--

balancedParens :: Int -> [String]
balancedParens 0 = [""]
balancedParens n = solve 0 $ n + n + 1
