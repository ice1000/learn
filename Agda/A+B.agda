module A+B where

open import Data.Nat
open import Relation.Binary.PropositionalEquality

_⇆₀_ : {A : Set} {a b c : A} → a ≡ b → b ≡ c → a ≡ c
refl ⇆₀ refl = refl

_⇆₁_ : {A : Set} {a b c : A} → a ≡ b → b ≡ c → a ≡ c
ab ⇆₁ bc with ab  | bc
...        | refl | refl = refl

+0 : {n : ℕ} → 0 + n ≡ n + 0
+0 = {!!}

plus-comm : ∀ {a b} → a + b ≡ b + a
plus-comm = {!!}

