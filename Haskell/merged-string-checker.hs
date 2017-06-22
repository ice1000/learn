module Codewars.Exercise.MergeChecker where

isMerge :: String -> String -> String -> Bool
isMerge [     ] [          ] [          ] = True
isMerge    s    [          ]       c      = s == c
isMerge    s          c      [          ] = s == c
isMerge [     ]       _            _      = False
isMerge (c : s) a1@(c1 : s1) a2@(c2 : s2)
  |b1 && b2  = isMerge s s1 a2 || isMerge s a1 s2
  |b1        = isMerge s s1 a2
  |b2        = isMerge s a1 s2
  |otherwise = False
  where b1 = c == c1
        b2 = c == c2
--

