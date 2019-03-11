{-# OPTIONS --guardedness --copattern --no-sized-types --safe #-}
module Kata where
open import Relation.Binary.PropositionalEquality
open import Data.Nat
open import Data.Vec using ([]; _∷_; Vec)
record Stream (A : Set) : Set where
  coinductive
  field
    head : A
    tail : Stream A
open Stream public

-- | Bisimulation as equality
record _==_ {A : Set} (x : Stream A) (y : Stream A) : Set where
  coinductive
  field
    refl-head : head x ≡ head y
    refl-tail : tail x == tail y
open _==_ public

variable A : Set

take : (n : ℕ) -> Stream A -> Vec A n
take zero _ = []
take (suc n) s = head s ∷ take n (tail s)

-- _ : (1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ []) ≡ take 15 ones
-- _ = refl

-- _ : (1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ 1 ∷ []) ≡ take 15 (repeat 1)
-- _ = refl

-- _ : take 100 ones ≡ take 100 (repeat 1)
-- _ = refl

module Introduction where

  -- Infinite sequence of `ones`.
  ones : Stream ℕ
  head ones = suc zero
  tail ones = ones

  -- Infinite sequence of give number
  repeat : {A : Set} -> A -> Stream A
  head (repeat a) = a
  tail (repeat a) = repeat a

  -- Odd and Even, as you've implemented in:
  -- https://www.codewars.com/kata/tear-me-apart-and-merge-the-pieces-together
  even : ∀ {A} -> Stream A -> Stream A
  head (even a) = head a
  tail (even a) = even (tail (tail a))

  -- Spoiler: implementation can be found in:
  -- https://github.com/agda/cubical/blob/master/Cubical/Codata/Stream/Properties.agda
  odd : ∀ {A} -> Stream A -> Stream A
  head (odd a) = head (tail a)
  tail (odd a) = odd (tail (tail a))

module Bisimulation where
  open Introduction

  -- Refl for bisimulation
  refl′ : ∀ {A} -> (a : Stream A) -> a == a
  refl-head (refl′ a) = refl
  refl-tail (refl′ a) = refl′ (tail a)

  oddEven : ∀ {A} -> (a : Stream A) -> odd a == even (tail a)
  refl-head (oddEven a) = refl
  refl-tail (oddEven a) = oddEven (tail (tail a))

  merge : ∀ {A} -> Stream A -> Stream A -> Stream A
  head (merge a _) = head a
  head (tail (merge _ b)) = head b
  tail (tail (merge a b)) = merge (tail a) (tail b)

  moe : (a : Stream A) -> (merge (even a) (odd a) == a)
  refl-head (moe a) = refl
  refl-head (refl-tail (moe a)) = refl
  refl-tail (refl-tail (moe a)) = moe (tail (tail a))

