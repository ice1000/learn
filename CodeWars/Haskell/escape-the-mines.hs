module EscapeTheMines where

import Control.Applicative

type XY = (Int, Int)
data Move = U | D | R | L deriving (Eq, Show)

dfs :: [[Bool]] -> XY -> XY -> Maybe [Move]
dfs m s e
  |s == e            = Just []
  |x < 0 || y < 0    = Nothing
  |x >= len m        = Nothing
  |y >= len (m !! x) = Nothing
  |not $ m !! x !! y = Nothing
  |otherwise = (R:) <$> dfs m (x + 1, y) e
           <|> (D:) <$> dfs m (x, y + 1) e
           <|> (L:) <$> dfs m (x - 1, y) e
           <|> (U:) <$> dfs m (x, y - 1) e
   where (x, y) = s
         len = length
--

solve :: [[Bool]] -> XY -> XY -> [Move] 
solve a b c = case dfs a b c of Just res -> res

--[[True, True, False, False, False, ], [False, True, True, False, False, ], [False, False, True, True, False, ], [False, False, False, True, True, ], [False, False, False, False, True, ]]
