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

-- data Production = Token
--                 | Expression AST
--                 | Term AST
--                 | Factor AST
--                 deriving (Eq, Show)
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

-- parse :: [Token] -> [Token] -> AST
-- parse params [TInt i] = Imm i
-- parse params [TStr s] = elemIndex (TStr s) params ==> Arg
-- -- parse params (TChar '(':(l:(op:(r:TChar ')')))) = parse params 
-- parse params (l:((TChar '+'):r)) = Add (parse params [l]) (parse params r)
-- parse params (l:((TChar '-'):r)) = Sub (parse params [l]) (parse params r)
-- parse params (l:((TChar '*'):r)) = Mul (parse params [l]) (parse params r)
-- parse params (l:((TChar '/'):r)) = Div (parse params [l]) (parse params r)
-- parse params ls = parse params $ reverse ls
--
-- apply1 :: (a, a) -> (a -> b) -> (b -> b -> b) -> b
-- apply1 (a, b) f1 f2 = f2 (f1 a) (f1 b)

mergeHelper :: Token -> AST -> AST -> AST
mergeHelper (TChar '+') a b = Add a b
mergeHelper (TChar '-') a b = Sub a b
mergeHelper (TChar '*') a b = Mul a b
mergeHelper (TChar '/') a b = Div a b

merger :: Token -> Token -> AST -> AST -> AST -> AST
merger (TChar a) (TChar b) x y z
  |a `elem` "+-" && b `elem` "*/" = mergeHelper (TChar a) x $ mergeHelper (TChar b) y z
  |otherwise                      = mergeHelper (TChar b) (mergeHelper (TChar a) x y) z
--

parse :: [Token] -> [Token] -> AST
parse params [TInt i] = Imm i
parse params [TStr s] = elemIndex (TStr s) params ==> Arg
--parse params (TChar '(':right)
parse params ls
  |elem (TChar '(') ls = let
    aaa = extract $ elemIndex (TChar '(') ls
    bbb = extract $ elemIndex (TChar ')') ls in let
    right = splitAt bbb ls in let
    -- [a*(b+c)-1]
    --  012345678
    -- aaa = 2, bbb = 6
    -- op1 = *, l = a
    -- op2 = -, r = 1
    -- m = b+c
    (op1 : l) = reverse $ fst $ splitAt aaa ls
    m = drop (aaa + 1) $ fst right
    (_ : (op2 : r)) = snd right in
    merger op1 op2 (parse params $ reverse l) (parse params m) (parse params r)
  |elem (TChar '+') ls = elemIndex (TChar '+') ls ==> (f Add)
  |elem (TChar '-') ls = elemIndex (TChar '-') ls ==> (f Sub)
  |elem (TChar '*') ls = elemIndex (TChar '*') ls ==> (f Mul)
  |elem (TChar '/') ls = elemIndex (TChar '/') ls ==> (f Div)
     where f  = (\fun x -> let (a, b) = (splitAt x ls) in (f2 a b fun))
           f2 = (\a b f -> f (parse params a) (parse params $ tail b))
--

pass1 :: String -> AST
pass1 code = let [params, tokens] = (splitOn [TChar ']'] (tail $ tokenize code))
             in parse params tokens
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




