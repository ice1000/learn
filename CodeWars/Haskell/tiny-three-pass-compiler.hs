module TinyThreePassCompiler where

import Data.Char
import Control.Monad
import Control.Applicative

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

newtype Parser val = Parser { parse :: [Production] -> [(val, [Production])]  }

instance Functor Parser where
  fmap f (Parser ps) = Parser $ \p -> [(f a, b) | (a, b) <- ps p]
--

instance Applicative Parser where
  pure = return
  (Parser p1) <*> (Parser p2) = Parser $ \p ->
    [(f a, s2) | (f, s1) <- p1 p, (a, s2) <- p2 s1]
--

unit :: a -> Parser a
unit a = Parser $ \s -> [(a, s)]

instance Monad Parser where
  return = unit
  p >>= f = Parser $ \s -> concatMap (\(a, s1) -> parse (f a) s1) $ parse p s
--

instance MonadPlus Parser where
  mzero = Parser $ \_ -> []
  mplus p q = Parser $ \s -> parse p s ++ parse q s
--

instance Alternative Parser where
  empty = mzero
  p <|> q = Parser $ \s -> case parse p s of
    [] -> parse q s
    rs -> rs
--

satisfy :: (Production -> Bool) -> Parser Production
satisfy p = item >>= (\c ->
  if p c then unit c else Parser $ \_ -> [])
--

parseCode :: Parser a -> [Production] -> a
parseCode parser production = case parse parser production of
  [(res, [])] -> res
  _           -> error "Hugh?"
--

item :: Parser Production
item = Parser $ \s -> case s of
  [] -> []
  (h:t) -> [(h, t)]
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

compile :: String -> [String]
compile = pass3 . pass2 . pass1

pass1 :: String -> AST
pass1 = undefined

pass2 :: AST -> AST
pass2 = undefined

pass3 :: AST -> [String]
pass3 = undefined

