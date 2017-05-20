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

data Production = FromToken Token
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

parse :: [Token] -> [Production] -> [Production]
parse _ [FromToken (TInt i)] = [Factor $ Imm i]
parse params [FromToken (TStr s)] = [Factor (elemIndex (TStr s) params ==> Arg)]
parse _ [FromToken (TChar '('), Expression expr, FromToken (TChar ')')] = [Factor expr]
parse _ [Expression expr, FromToken (TChar '+'), Term term] = [Expression $ Add expr term]
parse _ [Expression expr, FromToken (TChar '-'), Term term] = [Expression $ Sub expr term]
parse _ [Term term, FromToken (TChar '*'), Factor fact] = [Term $ Mul term fact]
parse _ [Term term, FromToken (TChar '/'), Factor fact] = [Term $ Div term fact]
parse _ [Factor fact] = [Term fact]
parse _ [Term term] = [Expression term]
parse _ production = production
--

parseHelper :: [Token] -> [Production] -> [Production]
parseHelper _ [p] = [p]
parseHelper p [a,b,c] = parse p [a,b,c]
parseHelper p pro = let after = ((chunksOf 3 pro) >>= (parse p)) in
    case length after of
      1 -> after
      _ -> if after /= pro then parseHelper p after
        else parseHelper p (head after : (parseHelper p $ init after))
  -- parseHelper p (h:t)

pass1 :: String -> AST
pass1 code = let
  [params, tokens0] = (splitOn [TChar ']'] (tail $ tokenize code))
  -- collapse = zipWith3 (\x y z -> [x, y, z]) tokens0 (tail tokens0) (drop 2 tokens0)
  production = tokens0 >>= (\x -> parse params [FromToken x]) in
  case parseHelper params production of
    [Expression parsed] -> parsed
    [Term parsed] -> parsed
    [Factor parsed] -> parsed
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




