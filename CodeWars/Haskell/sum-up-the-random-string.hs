module Codewars.Kata.SumString where

data Token = TChar Char
           | TInt Int
           | TStr String
           deriving (Eq, Show)
--

alpha, digit :: String
alpha = ['a'..'z'] ++ ['A'..'Z']
digit = ['0'..'9']

tokenize :: String -> [Token]
tokenize [] = []
tokenize xxs@(c:cs)
  | c `elem` "-+*/()[]" = TChar c : tokenize cs
  | not (null i) = TInt (read i) : tokenize is
  | not (null s) = TStr s : tokenize ss
  | otherwise = tokenize cs
  where
    (i, is) = span (`elem` digit) xxs
    (s, ss) = span (`elem` alpha) xxs
--

sumFromString :: String -> Integer
sumFromString n = sum $ f <$> tokenize n
  where f = \x -> case x of
                    (TInt i) -> toInteger i
                    _        -> toInteger 0
--
