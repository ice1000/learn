module A+B where

open import Data.Nat
open import Relation.Binary.PropositionalEquality

_⇆_ : {a b c : ℕ} → a ≡ b → b ≡ c → a ≡ c
_⇆_ refl refl = refl

plus-comm : ∀ {a b} → a + b ≡ b + a
plus-comm = {!!}

--reflexive : {n : ℕ} → 
