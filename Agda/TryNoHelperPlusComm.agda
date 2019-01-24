module TryNoHelperPlusComm where

open import Agda.Builtin.Nat
open import Agda.Builtin.Equality

sym : ∀ {A : Set} {a b : A} → a ≡ b → b ≡ a
sym refl = refl

comm : ∀ n m → n + m ≡ m + n
comm zero zero = refl
comm zero (suc m) rewrite sym (comm zero m)  = refl
comm (suc n) zero rewrite comm n zero = refl
comm (suc n) (suc m) rewrite comm n (suc m)
                           | sym (comm (suc n) m)
                           | comm n m = refl
