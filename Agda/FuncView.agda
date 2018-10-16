module FuncView where

open import Data.Sum
open import Data.Nat
open import Relation.Binary.PropositionalEquality
open import Function

record A : Set where
  eta-equality
  field
    x : ℕ

ordering : ∀ n m → n < m ⊎ n ≡ m ⊎ n > m
ordering zero zero = inj₂ $ inj₁ refl
ordering zero (suc _) = inj₁ $ s≤s z≤n
ordering (suc _) zero = inj₂ $ inj₂ $ s≤s z≤n
ordering (suc n) (suc m) with ordering n m
... | inj₁ x = inj₁ $ s≤s x
... | inj₂ (inj₁ refl) = inj₂ $ inj₁ refl
... | inj₂ (inj₂ y) = inj₂ $ inj₂ $ s≤s y

