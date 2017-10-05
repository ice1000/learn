module Laziness where

import Control.Arrow

type Matrix = [[Bool]]

mx = 100

myFind :: Matrix -> Int -> Int -> (Int, Int)
myFind m x y
  |m !! x !! y = (x, y)
  |x == mx     = myFind m 0 $ y + 1
  |otherwise   = myFind m (x + 1) y
---

findTrue :: Matrix -> (Int, Int)
findTrue m = myFind (take mx <$> (take mx <$> m)) 0 0
      
