{-# OPTIONS --prop --without-K #-}

open import Relation.Nullary
open import Data.Nat

data Squash {ℓ} (A : Set ℓ) : Prop ℓ where
  squash : A → Squash A

data _≡_ {ℓ} {A : Prop ℓ} (x : A) : A → Prop ℓ where
  refl : x ≡ x

test : squash 1 ≡ squash 2
test = refl

