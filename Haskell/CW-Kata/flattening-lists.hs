module Flatten where

flatten :: [[a]] -> [a]
flatten a = a >>= id
