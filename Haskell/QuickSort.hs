module Main where

if' :: Bool -> a -> a -> a
if' True x _ = x
if' False _  y = y

zipIf :: [Bool] -> [a] -> [a] -> [a]
zipIf x y z = zipWith3 if' x y z

-- zipIf [True, False, True] [1, 2, 3] [2, 3, 4]

qs :: (Ord a) => [a] -> [a]
qs []             = []
qs [x]            = [x]
qs [x, y]         = if' (x > y) [y, x] [x, y]
qs (head : tail)  = qs [e | e <- tail, e <= head]
                    ++ [head] ++
                    qs [e | e <- tail, e >  head]

main = putStrLn ""
