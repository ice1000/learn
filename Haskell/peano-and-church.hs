{-# LANGUAGE 
  FlexibleInstances, 
  UndecidableInstances, 
  InstanceSigs,
  ScopedTypeVariables,
  RankNTypes #-}

module PC where

import Data.List
import Data.Maybe

import Prelude hiding (pred)

type ISO a b = (a -> b, b -> a)
-- See https://www.codewars.com/kata/isomorphism

symm :: ISO a b -> ISO b a
symm (ab, ba) = (ba, ab)

substL :: ISO a b -> (a -> b)
substL = fst

substR :: ISO a b -> (b -> a)
substR = snd

liftISO2 :: ISO a b -> ISO (a -> a -> a) (b -> b -> b)
liftISO2 (ab, ba) = (\f b1 b2 -> ab $ f (ba b1) $ ba b2, \f a1 a2 -> ba $ f (ab a1) $ ab a2)

-- A Natural Number is either Zero,
-- or a Successor (1 +) of Natural Number.
-- We have (+)/(*) on Natural Number, or (-) it.
-- Since Natrual Number do not have negative, forall x, 0 - x = 0.
-- We also have pow on Natrual Number
-- Since Haskell is lazy, we also have infinity

class Nat n where
  zero :: n
  successor :: n -> n
  nat :: a -> (n -> a) -> n -> a -- Pattern Matching
  iter :: a -> (a -> a) -> n -> a -- Induction
  plus, minus, mult, pow :: n -> n -> n
  inf :: n
  inf = successor inf
  divide :: n -> n -> n
  l `divide` r | l == 0 && r == 0 = undefined
  l `divide` r | l < r = 0
  l `divide` r | otherwise = successor $ (l `minus` r) `divide` r
  -- notice (l `divide` 0) when l is not 0 will return inf
  isoP :: ISO n Peano -- See below for the definition of Peano
  isoP = (iter zero successor, iter zero successor)
  toP :: n -> Peano
  toP = substL isoP
--

instance {-# OVERLAPPABLE #-} Nat n => Show n where
  show = show . toP
--

instance {-# OVERLAPPABLE #-} Nat n => Eq n where
  l == r = toP l == toP r
--

instance {-# OVERLAPPABLE #-} Nat n => Ord n where
  l `compare` r = toP l `compare` toP r
--

instance {-# OVERLAPPABLE #-} Nat n => Num n where
  abs                   = id
  signum                = nat zero (const 1)
  fromInteger 0         = zero
  fromInteger n | n > 0 = successor $ fromInteger (n - 1)
  (+)                   = plus
  (*)                   = mult
  (-)                   = minus
--

-- We can encode Natrual Number directly as Algebraic Data Type(ADT).
data Peano = O | S Peano deriving (Show, Eq, Ord)

-- Remember, 0 - x = 0 for all x.
instance Nat Peano where
  zero              = O
  successor         = S
  nat d _ O         = d
  nat _ f (S s)     = f s
  iter d _ O        = d
  iter d f (S s)    = iter (f d) f s
  p `plus`  O       = p
  p `plus` (S q)    = (S p) `plus` q
  _ `mult`  O       = O
  O `mult`  _       = O
  p `mult` (S q)    = plus p $ p `mult` q
  p `minus` O       = p
  O `minus` _       = O
  minus (S p) (S q) = minus p q
  _ `pow`   O       = S O
  O `pow`   _       = O
  p `pow`  (S q)    = mult p $ p `pow` q
--

-- Peano is very similar to a basic data type in Haskell - List!
-- O is like [], and S is like :: (except it lack the head part)
-- When we want to store no information, we can use (), a empty tuple
-- This is different from storing nothing (called Void in Haskell),
-- as we can create a value of () by using (), 
-- but we cannot create a value of Void.

-- Notice how you can implement everything once you have isoP,
-- By converting to Peano and using Nat Peano?
-- Dont do that. You wont learn anything.
-- Try to use operation specific to list.
instance Nat [()] where
  zero                = []
  successor           = (() :)
  nat d _ []          = d
  nat _ f (_: a)      = f a
  iter d _ []         = d
  iter d f (_: a)     = iter (f d) f a
  plus                = (++)
  [] `minus` _        = []
  a `minus` []        = a
  minus (_: a) (_: b) = minus a b
  [] `mult` _         = []
  _ `mult` []         = []
  a `mult` b          = plus a $ mult a $ tail b
  _ `pow` []          = [()]
  [] `pow` _          = []
  a `pow` b           = mult a $ pow a $ tail b
--

-- Instead of defining Nat from zero, successor (and get Peano),
-- We can define it from Pattern Matching
newtype Scott = Scott { runScott :: forall a. a -> (Scott -> a) -> a }

instance Nat Scott where
  zero               = Scott const
  successor s        = Scott $ \_ f -> f s
  nat d f (Scott s)  = s d f
  iter d f (Scott s) = s d $ iter (f d) f
  -- Other operation on Scott numeral is sort of boring,
  -- So we implement it using operation on Peano.
  -- You shouldnt do this - I had handled all the boring case for you.
  plus               = substR (liftISO2 isoP) plus
  minus              = substR (liftISO2 isoP) minus
  mult               = substR (liftISO2 isoP) mult
  pow                = substR (liftISO2 isoP) pow
--

-- Or from induction!
newtype Church = Church { runChurch :: forall a. (a -> a) -> a -> a }

--
            ------------------- 666 -------------------
    -----------world-peace----- 666 -----intelligence-----------
  ----------------------------- 666 ------------------------------
-------------------smart!!----- 666 -----power!!--------------------
pred (Church n) = if n (+ 1) 1 /= 1
  then Just $ Church $ \f x -> n (\h g -> g $ h f) (\_ -> x) id
  else Nothing
-------------------smart!!----- 666 -----power!!--------------------
  ----------------------------- 666 ------------------------------
    -----------world-peace----- 666 -----intelligence-----------
            ------------------- 666 -------------------
--

instance Nat Church where
  zero                        = Church $ \_ -> id
  successor (Church f)        = Church $ \x -> f x . x
  nat d f c@(Church g)        = fromMaybe d $ f <$> pred c
  iter d f (Church g)         = g f d
  plus  (Church f) (Church g) = Church $ \x -> f x . g x
  mult  (Church f) (Church g) = Church $ f . g
  pow   (Church f) (Church g) = Church $ g f
  minus     f      (Church g) = g (\x -> fromMaybe zero $ pred x) f
-- Try to implement the calculation (except minus) in the primitive way.
-- Implement them by constructing Church explicitly.
-- So plus should not use successor,
-- mult should not use plus,
-- exp should not use mult.

