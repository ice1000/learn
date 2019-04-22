module Dec where

open import Relation.Nullary
open import Relation.Binary.PropositionalEquality
open import Agda.Builtin.Nat

decEq : (a b : Nat) → Dec (a ≡ b)
decEq zero zero = yes refl
decEq zero (suc b) = no (λ ())
decEq (suc a) zero = no (λ ())
decEq (suc a) (suc b) with decEq a b
decEq (suc a) (suc b) | yes refl = yes refl
decEq (suc a) (suc b) | no p = no λ x → p (cong (_- 1) x)

_>>1 : Nat → Nat
zero >>1 = zero
suc zero >>1 = zero
suc (suc n) >>1 = suc (n >>1)
