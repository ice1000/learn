module issue2855 where

open import Agda.Builtin.Nat
open import Agda.Builtin.Equality

test : (x y : Nat) → (x ≡ y) → (x ≡ 1) → (y ≡ 1) → Nat
test a b refl refl refl = zero
