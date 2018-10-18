module mut-rec where

open import Data.Nat renaming (ℕ to Nat)
open import Relation.Binary.PropositionalEquality

_/2 : Nat -> Nat
zero /2 = zero
suc zero /2 = zero
suc (suc n) /2 = suc (n /2)

{-# TERMINATING #-}
bits : Nat -> Nat
bits zero = zero
bits (suc n) = suc (bits (n /2))

test : 0 /2 ≡ 0
test = refl

test₂ : 1 /2 ≡ 0
test₂ = refl

test₃ : 2 /2 ≡ 1
test₃ = refl
