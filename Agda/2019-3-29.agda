{-# OPTIONS --guardedness #-}
module 2019-3-29 where

open import Agda.Builtin.Equality
open import Agda.Builtin.Nat

variable A : Set

simple : ∀ {a b : A} → a ≡ b → b ≡ a
simple refl = refl

module NewWay where
  record Stream (A : Set) : Set where
    constructor _∷_
    coinductive
    field
      head : A
      tail : Stream A
  open Stream

  ones : Stream Nat
  head ones = 1
  tail ones = ones

module OldWay where
  open import Agda.Builtin.Coinduction

  record Stream (A : Set) : Set where
    constructor _∷_
    inductive
    field
      head : A
      tail : ∞ (Stream A)

  ones : Stream Nat
  ones = 1 ∷ (♯ ones)
