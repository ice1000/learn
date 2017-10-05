module LongestCommonSubsequence where

lcs :: String -> String -> String
lcs "" _ = ""
lcs _ "" = ""
lcs [a] [b] = if a == b then [a] else ""
lcs [a] y = if elem a y then [a] else ""
lcs y [a] = if elem a y then [a] else ""
lcs x y |x1 == y1  = x1 : lcs x2 y2
        |otherwise = let xl = lcs x2 y
                         yl = lcs x y2
                     in
                         if length xl > length yl then xl else yl
        where (x1:x2) = x
              (y1:y2) = y
--
