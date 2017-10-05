{-# LANGUAGE
  FlexibleContexts,
  NoMonomorphismRestriction
#-}

module TinyThreePassCompiler  where

import Data.List
import Text.ParserCombinators.Parsec hiding (digit, token)

data AST = Imm Int
         | Arg Int
         | Add AST AST
         | Sub AST AST
         | Mul AST AST
         | Div AST AST
         deriving (Eq, Show)
--

alpha, digit :: String
alpha = ['a'..'z'] ++ ['A'..'Z']
digit = ['0'..'9']

sep = many $ char ' '
sep1 = many1 $ char ' '
oneParam = many1 $ oneOf alpha
oneNum = many1 $ oneOf digit
operator = many1 $ oneOf "+-*/()"
exprTokens = oneParam
  <|> oneNum
  <|> operator

params = do
  char '['
  sep
  get <- endBy oneParam sep
  char ']'
  return get
--

body = sepBy exprTokens sep
codeWars = do
  params
  body
--



-- compile :: String -> [String]
-- compile = pass3 . pass2 . pass1

-- pass1 :: String -> AST
-- pass1 code = 

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




