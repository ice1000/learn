module Codewars.Kata.Convert where

digitize :: Int -> [Int]
digitize s |s < 10 = [s]
           |otherwise = mod s 10 : digitize (div s 10)
--

