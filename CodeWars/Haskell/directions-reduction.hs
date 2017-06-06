module Codewars.Kata.Reduction where
import Codewars.Kata.Reduction.Direction

-- data Direction = North | East | West | South deriving (Eq)

dirReduce :: [Direction] -> [Direction]
dirReduce [] = []
dirReduce [a] = [a]
dirReduce (a : (b : c))
  |fuck a b  = dirReduce c
  |otherwise = case dirReduce $ b : c of
     [] -> [a]
     (h : t) -> if fuck a h then dirReduce t else a : h : (dirReduce t)
  where fuck North South = True
        fuck South North = True
        fuck East  West  = True
        fuck West  East  = True
        fuck _     _     = False
---


