module TinyThreePassCompiler where

import Data.Char
import Data.List
import Data.List.Split (splitOn)
import Data.Maybe
import Control.Monad
import Control.Applicative hiding (many, some)

data AST = Imm Int
         | Arg Int
         | Tmp String
         | Add AST AST
         | Sub AST AST
         | Mul AST AST
         | Div AST AST
         deriving (Eq, Show)
--

alpha = ['a'..'z'] ++ ['A'..'Z']

-----------------------------------------------------
--------------- my parser combinator ----------------
-----------------------------------------------------

newtype Parser val = Parser { parse :: String -> [(val, String)]  }

parseCode :: Parser a -> String -> a
parseCode m s = case parse m s of
  [(res, [])] -> res
  _           -> error "Hugh?"
--

instance Functor Parser where
  fmap f (Parser ps) = Parser $ \p -> [(f a, b) | (a, b) <- ps p]
--

instance Applicative Parser where
  pure = return
  (Parser p1) <*> (Parser p2) = Parser $ \p ->
    [(f a, s2) | (f, s1) <- p1 p, (a, s2) <- p2 s1]
--

instance Monad Parser where
  return a = Parser $ \s -> [(a, s)]
  p >>= f  = Parser $ concatMap (\(a, s1) -> parse (f a) s1) . parse p
--

instance MonadPlus Parser where
  mzero     = Parser $ const []
  mplus p q = Parser $ \s -> parse p s ++ parse q s
--

instance Alternative Parser where
  empty   = mzero
  p <|> q = Parser $ \s -> case parse p s of
    [] -> parse q s
    rs -> rs
--

item :: Parser Char
item = Parser $ \s -> case s of
  [     ] -> []
  (h : t) -> [(h, t)]
--

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = item >>= \c -> if p c then return c else empty

chainl1 :: Parser a -> Parser (a -> a -> a) -> Parser a
chainl1 p op = do
  a <- p
  rest a
  where rest a = (do
          f <- op
          b <- p
          rest $ f a b)
          <|> return a
--

chainl p op = (chainl1 p op <|>) . return

-- | 1+
some v = someV
  where manyV = someV <|> pure []
        someV = (:) <$> v <*> manyV
--

-- | 0+
many v = manyV
  where manyV = someV <|> pure []
        someV = (:) <$> v <*> manyV
--

oneOf = satisfy . flip elem
char = satisfy . (==)
nat = read <$> some digit :: Parser Int
digit = satisfy isDigit
reserved = token . string
spaces = many $ oneOf " \n\r\t"

string [      ] = return []
string (c : cs) = do
  char c
  string cs
  return $ c : cs
--

token p = do
  a <- p
  spaces
  return a
--

number = do
  s <- string "-" <|> return []
  cs <- some digit
  return $ read $ s ++ cs
--

parens m = do
  reserved "("
  n <- m
  reserved ")"
  return n
--

int :: Parser AST
int = do
  n <- number
  spaces
  return $ Imm n
--

arg :: Parser AST
arg = do
  n <- some $ oneOf alpha
  spaces
  return $ Tmp n
--

binOp x = (reserved x >>) . return
addop = binOp "+" Add <|> binOp "-" Sub
mulop = binOp "*" Mul <|> binOp "/" Div
expr = chainl1 term addop
term = chainl1 factor mulop
factor = int <|> arg <|> parens expr
function = do
  reserved "["
  args <- many $ oneOf $ alpha ++ " "
  reserved "]"
  spaces
  ex <- expr
  return ([ arg | arg <- splitOn " " args, arg /= "" ], ex)
--

compile :: String -> [String]
compile = pass3 . pass2 . pass1
firstTwoPass = pass2 . pass1

pass1 :: String -> AST
pass1 = f . parseCode function
  where f (args, (Imm i))   = Imm i
        f (args, (Tmp a))   = Arg $ fromJust $ elemIndex a args
        f (args, (Add a b)) = Add (f (args, a)) $ f (args, b)
        f (args, (Sub a b)) = Sub (f (args, a)) $ f (args, b)
        f (args, (Mul a b)) = Mul (f (args, a)) $ f (args, b)
        f (args, (Div a b)) = Div (f (args, a)) $ f (args, b)
--

pass2 :: AST -> AST
pass2 (Imm i)   = Imm i
pass2 (Arg a)   = Arg a
pass2 (Add a b) = case (pass2 a, pass2 b) of
  (Imm x, Imm y) -> Imm $ x + y
  (  x  ,   y  ) -> Add x y
pass2 (Sub a b) = case (pass2 a, pass2 b) of
  (Imm x, Imm y) -> Imm $ x - y
  (  x  ,   y  ) -> Sub x y
pass2 (Mul a b) = case (pass2 a, pass2 b) of
  (Imm x, Imm y) -> Imm $ x * y
  (  x  ,   y  ) -> Mul x y
pass2 (Div a b) = case (pass2 a, pass2 b) of
  (Imm x, Imm y) -> Imm $ div x y
  (  x  ,   y  ) -> Div x y
--

pass3 :: AST -> [String]
pass3 (Imm i)   = ["IM " ++ show i]
pass3 (Arg a)   = ["AR " ++ show a]
pass3 (Add a b) = pass3 a ++ ["PU"] ++ pass3 b ++ ["SW", "PO", "AD"]
pass3 (Sub a b) = pass3 a ++ ["PU"] ++ pass3 b ++ ["SW", "PO", "SU"]
pass3 (Mul a b) = pass3 a ++ ["PU"] ++ pass3 b ++ ["SW", "PO", "MU"]
pass3 (Div a b) = pass3 a ++ ["PU"] ++ pass3 b ++ ["SW", "PO", "DI"]
