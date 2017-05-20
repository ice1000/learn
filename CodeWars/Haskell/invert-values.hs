module Kata (invert) where

invert :: [Integer] -> [Integer]
invert arr = (0 -) <$> arr

