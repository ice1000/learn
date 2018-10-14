{-# OPTIONS --without-K #-}
module WithoutK-Test where

-- open import Data.Bool
open import Data.Nat
open import Relation.Binary.PropositionalEquality

kksk : ∀ a → a ≡ ℕ → ℕ
kksk .ℕ refl = zero

kksk-wtf : ℕ ≡ ℕ → ℕ
kksk-wtf = kksk ℕ

-- kksk-why : ℕ ≡ ℕ → ℕ
-- kksk-why refl = zero
