{-# OPTIONS --guardedness #-}
module Bisi where

open import Agda.Builtin.Equality

variable A : Set

record List (A : Set) : Set where
  coinductive
  field
    head : A
    tail : List A
open List

record _==_ (x : List A) (_ : List A) : Set where
  coinductive
  field
    refl-head : head x ≡ head x
    refl-tail : tail x == tail x
open _==_

data Nat : Set where
  zero : Nat
  succ : Nat -> Nat

ones : List Nat
head ones = succ zero
tail ones = ones

proof : (a : List Nat) -> a == a
refl-head (proof a) = refl
refl-tail (proof a) = proof (tail a)
