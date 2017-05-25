module EscapeTheMines where

import Control.Applicative

type XY = (Int, Int)
data Move = U | D | R | L deriving (Eq, Show)

myUnmapForTests = map (map (== ' '))

dfs :: [[Bool]] -> [XY] -> XY -> XY -> Maybe [Move]
dfs m v s e
  |s == e            = Just []
  |x < 0 || y < 0    = Nothing
  |x >= len m        = Nothing
  |y >= len (m !! x) = Nothing
  |elem s v          = Nothing
  |not $ m !! x !! y = Nothing
  |otherwise = (R:) <$> f (x + 1, y)
           <|> (D:) <$> f (x, y + 1)
           <|> (L:) <$> f (x - 1, y)
           <|> (U:) <$> f (x, y - 1)
   where (x, y) = s
         len = length
         f a = dfs m (s : v) a e
--

solve :: [[Bool]] -> XY -> XY -> [Move] 
solve a b c = case dfs a [] b c of Just res -> res

exampleTest = [[True,  True,  False, False, False],
               [False, True,  True,  False, False],
               [False, False, True,  True,  False],
               [False, False, False, True,  True ],
               [False, False, False, False, True]]
--

exampleMap1 = myUnmapForTests [" #"
                              ,"  "]
--

