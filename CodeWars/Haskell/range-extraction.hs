module RangeExtractor.JorgeVS.Kata where

reduce :: [Int] -> [Int] -> [[Int]]
reduce old [] = [old]
reduce old new
  |a == z + 1 = reduce (old ++ [a]) b
  |otherwise  = old : reduce [a] b
  where z     = last old
        (a:b) = new
--

toString :: [Int] -> String
toString [a]   = ',' : show a
toString [a,b] = ',' : show a ++ "," ++ show b
toString lst   = ',' : show (head lst) ++ "-" ++  show (last lst)

solution :: [Int] -> String
solution (h:t) = tail $ foldr (++) "" $ map toString $ reduce [h] t

