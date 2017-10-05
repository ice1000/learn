{-# LANGUAGE
  NoImplicitPrelude,
  GADTs,
  DataKinds,
  TypeFamilies,
  TypeOperators,
  RankNTypes,
  DeriveFunctor,
  UndecidableInstances
  #-}
--

module Singletons where

import Prelude hiding (drop,
                       take,
                       head,
                       tail,
                       index,
                       zipWith,
                       replicate,
                       map,
                       (++))
--

data Vec a n where
  VNil :: Vec a Zero
  VCons :: a -> Vec a n -> Vec a (Succ n)
--

-- promoted to type level by data kinds
data Nat = Zero | Succ Nat deriving (Show)

data SNat a where
  SZero :: SNat Zero
  SSucc :: SNat a -> SNat (Succ a)
--

type family (a :: Nat) :< (b :: Nat) :: Bool
type instance m :< Zero = False
type instance Zero :< Succ n = True
type instance (Succ m) :< (Succ n) = m :< n

type family (Add (a :: Nat) (b :: Nat)) :: Nat
type instance Add Zero m     = m
type instance Add (Succ n) m = Succ (Add n m)

-- question: why I cannot use wildcard???
type family (Sub (a :: Nat) (b :: Nat)) :: Nat
type instance Sub m Zero            = m
type instance Sub Zero m            = Zero
type instance Sub (Succ n) (Succ m) = Sub n m

type family (Min (a :: Nat) (b :: Nat)) :: Nat
type instance Min m Zero            = Zero
type instance Min Zero m            = Zero
type instance Min (Succ n) (Succ m) = Succ (Min n m)

map :: (a -> b) -> Vec a n -> Vec b n
map f VNil = VNil
map f (VCons x xs) = VCons (f x) $ map f xs

index :: ((a :< b) ~ True) => SNat a -> Vec s b -> s
index SZero (VCons v _) = v
index (SSucc n) (VCons _ xs) = index n xs

replicate :: s -> SNat a -> Vec s a
replicate s SZero = VNil
replicate s (SSucc n) = VCons s $ replicate s n

-- Both vectors must be of equal length
zipWith :: (x -> y -> z) -> Vec x a -> Vec y a -> Vec z a
zipWith _ VNil VNil = VNil
zipWith f (VCons v l) (VCons v2 l2) = VCons (f v v2) $ zipWith f l l2

(++) :: Vec v m -> Vec v n -> Vec v (Add m n)
VNil ++ ls        = ls
(VCons a b) ++ ls = VCons a (b ++ ls)

-- The semantics should match that of take for normal lists.
take :: SNat n -> Vec a m -> Vec a (Min m n)
take _     VNil            = VNil
take SZero _               = VNil
take (SSucc n) (VCons a m) = VCons a $ take n m

-- The semantics should match that of drop for normal lists.
drop :: SNat n -> Vec a m -> Vec a (Sub m n)
drop _     VNil            = VNil
drop SZero survivor        = survivor
drop (SSucc n) (VCons a m) = drop n m

head :: Vec a n -> a
head (VCons a n) = a

tail :: Vec a (Succ n) -> Vec a n
tail (VCons _ m) = m

-- Fuck dependent type

numberOne = Succ Zero
numberTwo = Succ numberOne
numberThree = Succ numberTwo
numberFour = Succ numberThree
numberFive = Succ numberFour
numberSix = Succ numberFive
numberSeven = Succ numberSix

exampleTestList = VCons numberFive $ VCons numberSix $ VCons numberTwo $ VCons numberFour $ VCons numberSeven VNil

