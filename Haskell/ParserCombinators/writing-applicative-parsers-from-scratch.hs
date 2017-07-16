module ApplicativeParser where

import Data.Char
import Data.List
import Data.Maybe
import Control.Monad hiding (MonadPlus, mzero, mplus)
import Prelude hiding (fmap)

alpha = ['a'..'z'] ++ ['A'..'Z']

-- | A monoid on applicative functors.
class Applicative f => Alternative f where
    -- | The identity of '<|>'
    empty :: f a
    -- | An associative binary operation
    (<|>) :: f a -> f a -> f a
--

instance Alternative Maybe where
    empty = Nothing
    Nothing <|> r = r
    l       <|> _ = l
--

-- | Monads that also support choice and failure.
class (Alternative m, Monad m) => MonadPlus m where
   -- | the identity of 'mplus'.  It should also satisfy the equations
   -- > mzero >>= f  =  mzero
   -- > v >> mzero   =  mzero
   mzero :: m a
   mzero = empty
   -- | an associative operation
   mplus :: m a -> m a -> m a
   mplus = (<|>)
--

-----------------------------------------------------
--------------- my parser combinator ----------------
-----------------------------------------------------

-- | An ambiguous parser.
newtype Parser val = P { unP :: String -> [(String, val)]  }

parse = unP

-- | Apply a parser and return all ambiguous results, but only those where the input was fully consumed.
runParser :: Parser a -> String -> [a]
runParser m s = case parse m s of
  [] -> [] -- error "Hugh?"
  ls -> [ o | (x, o) <- ls, x == [] ]
--

instance Functor Parser where
  fmap f (P ps) = P $ \p -> [ (a, f b) | (a, b) <- ps p ]
--

instance Applicative Parser where
  pure = return
  (P p1) <*> (P p2) = P $ \p ->
    [(s2, f a) | (s1, f) <- p1 p, (s2, a) <- p2 s1]
--

instance Monad Parser where
  return a = P $ \s -> [(s, a)]
  p >>= f  = P $ concatMap (\(a, s1) -> parse (f a) s1) . (swap <$>) . parse p
    where swap (a, b) = (b, a)
--

instance Alternative Parser where
  empty   = mzero
  p <|> q = P $ \s -> case parse p s of
    [] -> parse q s
    rs -> rs
--

instance MonadPlus Parser where
  mzero     = P $ const []
  mplus p q = P $ \s -> parse p s ++ parse q s
--

item :: Parser Char
item = P $ \s -> case s of
  [     ] -> []
  (h : t) -> [(t, h)]
--

-- | Parse a character only when a predicate matches.
predP :: (Char -> Bool) -> Parser Char
predP p = item >>= \c -> if p c then return c else empty

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


-- | Apply the parser one or more times.
some :: Parser a -> Parser [a]
some v = someV
  where manyV = someV <|> pure []
        someV = (:) <$> v <*> manyV
--

-- | Apply the parser zero or more times.
many :: Parser a -> Parser [a]
many v = manyV
  where manyV = someV <|> pure []
        someV = (:) <$> v <*> manyV
--

-- | Succeed only when parsing the given character.
charP :: Char -> Parser Char
charP = predP . (==)

oneOf = predP . flip elem
nat = read <$> some digit :: Parser Int
digit = predP isDigit
spaces = many $ oneOf " \n\r\t"

-- | Parse a whole string.
stringP :: String -> Parser String
stringP [      ] = return []
stringP (c : cs) = do
  charP c
  stringP cs
  return $ c : cs
--

number = do
  s <- stringP "-" <|> return []
  cs <- some digit
  return $ read $ s ++ cs
--

const' :: Parser Expr
const' = do
  n <- number
  return $ ConstE n
--

neg' :: Parser Expr
neg' = do
  stringP "-"
  e <- expr
  return $ NegE e
--

binOpExpr' :: Parser Expr
binOpExpr' = do
  stringP "("
  e1 <- expr
  stringP " "
  op <- binOp'
  stringP " "
  e2 <- expr
  stringP ")"
  return $ BinOpE op e1 e2
--

zero' = stringP "z" >> return ZeroE
binOp' = (stringP "+" >> return AddBO) <|> (stringP "*" >> return MulBO)
expr = const' <|> binOpExpr' <|> zero' <|> neg'

-- | Change the result of a parser.
pmap :: (a -> b) -> Parser a -> Parser b
pmap = (<$>)

-- | Operator version of 'pmap'.
(<#>) :: (a -> b) -> Parser a -> Parser b
(<#>) = pmap

-- | Parse a value and replace it.
(<#) :: a -> Parser b -> Parser a
(<#) a = (const a <$>)

infixl 4 <#
infixl 4 <#>

-- | Inject a value into an identity parser.
inject :: a -> Parser a
inject = return

-- | Given a parser with a function value and another parser, parse the function
-- first and then the value, return a parser which applies the function to the
-- value.
(<@>) :: Parser (a -> b) -> Parser a -> Parser b
(<@>) = (<*>)

(<@) :: Parser a -> Parser b -> Parser a
(<@) = (<*)

(@>) :: Parser a -> Parser b -> Parser b
(@>) = (*>)

infixl 4 <@
infixl 4 @>
infixl 4 <@>

-- | Construct a parser that never parses anything.
emptyP :: Parser a
emptyP = empty

-- | Combine two parsers: When given an input, provide the results of both parser run on the input.
(<<>>) :: Parser a -> Parser a -> Parser a
(<<>>) = mplus

infixl 3 <<>>

-- | Apply a parser and only return a result, if there was only one unambiguous result with output fully consumed.
runParserUnique :: Parser a -> String -> Maybe a
runParserUnique p cs = case runParser p cs of
  [a] -> Just a
  _   -> Nothing
--

-- | Kinds of binary operators.
data BinOp = AddBO | MulBO deriving (Eq, Show)

-- | Some kind of arithmetic expression.
data Expr = ConstE Int
          | BinOpE BinOp Expr Expr
          | NegE Expr
          | ZeroE
          deriving (Eq, Show)
--

evalExpr :: Expr -> Int
evalExpr (ConstE i) = i
evalExpr (NegE ne)  = 0 - evalExpr ne
evalExpr ZeroE      = 0
evalExpr (BinOpE AddBO e1 e2) = evalExpr e1 + evalExpr e2
evalExpr (BinOpE MulBO e1 e2) = evalExpr e1 * evalExpr e2

-- | Parse arithmetic expressions, with the following grammar:
--
--     expr         ::= const | binOpExpr | neg | zero
--     const        ::= int
--     binOpExpr    ::= '(' expr ' ' binOp ' ' expr ')'
--     binOp        ::= '+' | '*'
--     neg          ::= '-' expr
--     zero         ::= 'z'
-- 

parseExpr :: String -> Maybe Expr
parseExpr cs = case runParser expr cs of
    (h : _) -> Just h
    [     ] -> Nothing
--
