module Codewars.Kata.LastFib where

lastFibDigit :: Integer -> Int
lastFibDigit x = let fucker = 0 : 1 : (zipWith (\x y -> mod (x + y) 10) fucker $ tail fucker) in
  fucker !! (fromInteger x)
--
