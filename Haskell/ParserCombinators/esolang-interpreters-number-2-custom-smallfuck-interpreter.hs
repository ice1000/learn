module Haskell.SylarDoom.Smallfuck where

findMatched :: Int -> String -> Int
findMatched i = f 0 $ i + 1
  where f 0 i s
          |s !! i == '[' = f 1 (i + 1) s
          |s !! i == ']' = i
          |otherwise     = f 0 (i + 1) s
        f n i s
          |s !! i == '[' = f (n + 1) (i + 1) s
          |s !! i == ']' = f (n - 1) (i + 1) s
          |otherwise     = f    n    (i + 1) s
--

flipChar :: Char -> Char
flipChar '1' = '0'
flipChar '0' = '1'

-- |               code     stack    data-l    mid     data-r    pos     out
implementation :: String -> [Int] -> String -> Char -> String -> Int -> String
implementation [] _ dl d dr _ = dl ++ [d] ++ dr
implementation c s dl d dr pos
  -- out of range
  |pos >= length c = dl ++ [d] ++ dr
  |otherwise       = case c !! pos of
     '>' -> case dr of
       [     ] -> dl ++ [d]
       (h : t) -> continue s (dl ++ [d]) h t $ pos + 1
     '<' -> case dl of
       [] -> d : dr
       dl -> continue s (init dl) (last dl) (d : dr) $ pos + 1
     '*' -> continue s dl (flipChar d) dr $ pos + 1
     '[' -> case d of
       '1' -> continue (pos : s) dl d dr $ pos + 1
       '0' -> continue      s    dl d dr $ 1 + findMatched pos c
     ']' -> let (h : t) = s in case d of
       '1' -> continue t dl d dr h
       '0' -> continue t dl d dr $ pos + 1
     _   -> continue s dl d dr $ pos + 1
  where continue = implementation c
--

interpreter :: String -> String -> String
interpreter  _   [        ] = []
interpreter [  ]    tape    = tape
interpreter code (h : tape) = implementation code [] [] h tape 0
