module Haskell.Codewars.Peano where

import Prelude hiding (even, odd, div, compare, Num, Int, Integer, Float, Double, Rational, Word)

data Peano = Zero | Succ Peano deriving (Eq, Show)

add, sub, mul, div :: Peano -> Peano -> Peano
-- Addition
add a Zero = a
add Zero a = a
add a (Succ b) = add (Succ a) b
-- Subtraction
sub a Zero = a
sub Zero a = error "negative number"
sub (Succ a) (Succ b) = sub a b
-- Multiplication
mul _ Zero = Zero
mul Zero _ = Zero
mul a (Succ b) = add a $ mul a b
-- Integer division
div _ Zero = error "divide by 0"
div Zero _ = Zero
div a b = case compare a b of
  LT -> Zero
  EQ -> Succ Zero
  GT -> Succ $ div (sub a b) b
--

even, odd :: Peano -> Bool
-- Even
even Zero        = True
even (Succ Zero) = False
even (Succ a)    = odd a
-- Odd
odd = not . even

compare :: Peano -> Peano -> Ordering
compare Zero Zero = EQ
compare Zero _    = LT
compare _    Zero = GT
compare (Succ a) (Succ b) = compare a b
