module TinyThreePassCompiler where

import Data.List.Split
import Data.List

data AST = Imm Int
         | Arg Int
         | Add AST AST
         | Sub AST AST
         | Mul AST AST
         | Div AST AST
         deriving (Eq, Show)
--

data Production = Token
                | Expression AST
                | Term AST
                | Factor AST
                deriving (Eq, Show)
--

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

-- compile :: String -> [String]
-- compile = pass3 . pass2 . pass1

(==>) :: Maybe a -> (a -> b) -> b
(==>) (Just a) f = f a
-- (==>) Nothing _ = No errors

extract :: Maybe a -> a
extract (Just a) = a
-- extract Nothing = No errors

mergeHelper :: Token -> AST -> AST -> AST
mergeHelper (TChar '+') a b = Add a b
mergeHelper (TChar '-') a b = Sub a b
mergeHelper (TChar '*') a b = Mul a b
mergeHelper (TChar '/') a b = Div a b

parse :: [Token] -> [Production] -> Maybe Production
parse _ [TInt i] = Just $ Factor $ Imm i
parse params [TStr s] = Just $ Factor (elemIndex (TStr s) params ==> Arg)
parse _ (TChar '(':(Expression expr:(TChar ')':rest))) = Just $ Factor expr
parse _ (Expression expr:(TChar '+':(Term term:rest))) = Just $ Expression $ Add expr term
parse _ (Expression expr:(TChar '-':(Term term:rest))) = Just $ Expression $ Sub expr term
parse _ (Term term:(TChar '*':(Factor fact:rest))) = Just $ Term $ Mul term fact
parse _ (Term term:(TChar '/':(Factor fact:rest))) = Just $ Term $ Div term fact
parse _ (Factor fact) = Just $ Term fact
parse _ (Term term) = Just $ Expression term
parse _ _ = Nothing
--

pass1 :: String -> AST
pass1 code = let [params, tokens] = (splitOn [TChar ']'] (tail $ tokenize code))
             in -- collapse
               -- TODO
--

evaluate :: AST -> AST
evaluate (Add (Imm a) (Imm b)) = Imm (a + b)
evaluate (Sub (Imm a) (Imm b)) = Imm (a - b)
evaluate (Mul (Imm a) (Imm b)) = Imm (a * b)
evaluate (Div (Imm a) (Imm b)) = Imm $ div a b
evaluate wtf = wtf

-- pass2 :: AST -> AST
-- pass2 = undefined

-- pass3 :: AST -> [String]
-- pass3 = undefined




