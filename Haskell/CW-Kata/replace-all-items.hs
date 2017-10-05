module ReplaceAllItems where

replaceAll :: Eq a => [a] -> a -> a -> [a]
replaceAll [     ] _ _ = []
replaceAll (a : b) o n = (if a == o then n else a) : replaceAll b o n
