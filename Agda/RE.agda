{-# OPTIONS --rewriting #-}
-- Rewrite:Zero − Proving theorems in Another World
module RE where

open import Relation.Binary.PropositionalEquality
open import Data.Nat

infixl 2 _↦_
postulate
  _↦_ : ∀ {i} {A : Set i} → A → A → Set i

{-# BUILTIN REWRITE _↦_ #-}

postulate
  +-comm-r : ∀ {n m} → n + m ↦ m + n
  {-# REWRITE +-comm-r #-}
  *-succ-r : ∀ {a b} → a + a * b ↦ a * suc b
  {-# REWRITE *-succ-r #-}

*-comm : ∀ a b → a * b ≡ b * a
*-comm a b = ?
