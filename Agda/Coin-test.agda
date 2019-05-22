{-# OPTIONS --omega-in-omega --sized-types #-}
module Coin-test where

open import Data.Nat
open import Agda.Primitive
open import Size

record Colist {i : Size} {a} (A : Set a) : Set a where
  coinductive
  constructor _∷_
  field
    head : A
    tail : {j : Size< i} -> Colist {j} {a} A

open Colist

-- simple : Colist ℕ
-- simple = 1 ∷ simple

cosimple : ∀ {i} -> Colist {i} ℕ
head cosimple = 1
tail cosimple = cosimple

ZipWith : Setω
ZipWith = ∀ {a i} {A B C : Set a} -> (A -> B -> C)
        -> Colist {i} A -> Colist {i} B -> Colist {i} C

zipWith : ZipWith
head (zipWith f a b) = f (head a) (head b)
tail (zipWith f a b) = zipWith f (tail a) (tail b)

infixl 5 _!!_
_!!_ : ∀ {a} {A : Set a} -> Colist A -> ℕ -> A
ls !! zero = head ls
ls !! suc n = tail ls !! n

cofib : ∀ {i} -> Colist {i} ℕ
head cofib = 0
head (tail cofib) = 1
tail (tail cofib) = zipWith _+_ cofib (tail cofib)
