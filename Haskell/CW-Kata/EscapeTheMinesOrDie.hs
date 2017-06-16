module EscapeTheMinesOrDie where

import Control.Applicative

type XY = (Int, Int)
data Move = U | D | R | L
          deriving (Eq, Show)

dfs :: [XY] -> [[Bool]] -> XY -> XY -> Maybe [Move]
dfs v m s e
  |x < 0 || y < 0    = Nothing
  |x >= len m        = Nothing
  |y >= len (m !! x) = Nothing
  |not $ m !! x !! y = Nothing
  |s == e            = Just []
  |elem s v          = Nothing
  |otherwise = (R:) <$> f (x + 1, y)
               <|> (D:) <$> f (x, y + 1)
               <|> (L:) <$> f (x - 1, y)
               <|> (U:) <$> f (x, y - 1)
  where (x, y) = s
        len = length
        f a = dfs (s : v) m a e
--

solve :: [[Bool]] -> XY -> XY -> Maybe [Move]
solve = dfs []
                                                                                
