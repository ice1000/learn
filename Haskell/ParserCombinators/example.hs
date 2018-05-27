{-# LANGUAGE LambdaCase #-}

module Example where

import Data.Char
import Data.List
import Data.List.Split (splitOn)
import Data.Maybe
import Control.Monad
import Control.Applicative

alpha = ['a'..'z'] ++ ['A'..'Z']


newtype Parser val = Parser { parse :: String -> [(val, String)]  }

parseCode :: Parser a -> String -> Either String a
parseCode m s = case parse m s of
  [(res, [])] -> Right res
  _           -> Left "Hugh?"
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
item = Parser $ \case
  [     ] -> []
  (h : t) -> [(h, t)]
--

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = item >>= \c -> if p c then return c else empty

char :: Char -> Parser Char
char c = satisfy (== c)

alphaC :: Parser Char
alphaC = oneOf alpha

oneOf :: String -> Parser Char
oneOf c = satisfy (`elem` c)

unchar :: Char -> Parser Char
unchar c = satisfy (/= c)

someChars :: Parser String
someChars = do
  a <- unchar 'c'
  b <- char 'd' <|> char 'a'
  return [a, b]

string :: String -> Parser String
string [] = return []
string (x : xs) = do
  char x
  string xs
  return $ x : xs

alphaParser :: Parser String
alphaParser = some alphaC

whitespace :: Parser String
whitespace = many $ oneOf " \t\r\n\f"

tokenParser :: Parser [String]
tokenParser = many $ do
  token <- alphaParser
  whitespace
  return token
--

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

data AST = ID | AST :+: AST deriving (Eq, Show)

option :: Parser a -> a -> Parser a
option m d = m <|> return d

idParser :: Parser AST
idParser = alphaParser >> return ID

opParser :: Parser AST
opParser = chainl1 idParser $ do
  whitespace
  char '+'
  whitespace
  return $ \x y -> x :+: y
