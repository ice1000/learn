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

module Singletons where

import Prelude hiding (drop, take, head, tail, index, zipWith, replicate, map, (++))

data Vec a n where
  VNil :: Vec a Zero
  VCons :: a -> Vec a n -> Vec a (Succ n)
--

-- promoted to type level by data kinds
data Nat = Zero | Succ Nat

data SNat a where
  SZero :: SNat Zero
  SSucc :: SNat a -> SNat (Succ a)
--

type family (a :: Nat) :< (b :: Nat) :: Bool
type instance m :< Zero = False
type instance Zero :< Succ n = True
type instance (Succ m) :< (Succ n) = m :< n

type family (Add (a :: Nat) (b :: Nat)) :: Nat
type instance (Add Zero m) = m
type instance (Add (Succ n) m) = Add n (Succ m)

map :: (a -> b) -> Vec a n -> Vec b n
map f VNil = VNil
map f (VCons x xs) = VCons (f x) (map f xs)

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
VNil ++ VNil = VNil
(VCons x y) ++ VNil = (VCons x y)
VNil ++ (VCons x y) = (VCons x y)
--(VCons a b) ++ (VCons x y) = (VCons x (VCons a b)) ++ y

-- The semantics should match that of take for normal lists.
-- take :: ??
take = undefined

-- The semantics should match that of drop for normal lists.
-- drop :: ??
drop = undefined

-- head :: ??
head = undefined

-- tail :: ??
-- tail = xs


