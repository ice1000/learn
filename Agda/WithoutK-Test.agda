{-# OPTIONS --without-K #-}
module WithoutK-Test where

open import Agda.Builtin.Nat
open import Agda.Builtin.Equality
open import Data.Bool

kksk : ∀ a → a ≡ Nat → Nat
kksk .Nat refl = zero

kksk-wtf : Nat ≡ Nat → Nat
kksk-wtf = kksk Nat

coerce : ∀ {A B : Set} → A ≡ B → A → B
coerce refl a = a

-- coerce-id : (p : Bool ≡ Bool) → coerce p true ≡ true
-- coerce-id refl = refl

-- kksk-why : Nat ≡ Nat → Nat
-- kksk-why refl = zero
