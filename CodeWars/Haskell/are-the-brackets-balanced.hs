module Codewars.Exercises.Balanced where

isBalanced :: String -> Bool
isBalanced ")(" = False
isBalanced xs = length [ a | a <- xs, a == '(' ] == length [ a | a <- xs, a == ')' ]
