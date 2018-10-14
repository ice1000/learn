module WithAbs where

open import Agda.Builtin.Equality
open import Agda.Builtin.Nat

postulate wa : Nat → Set
postulate comm : ∀ a b → a + b ≡ b + a

wa'' : ∀ m n -> wa (m + n) ≡ wa (n + m)
wa'' m n = wa''-aux m n (n + m) (comm n m)
  where    
    wa''-aux : ∀ m n w -> w ≡ m + n -> wa (m + n) ≡ wa w
    wa''-aux m n .(m + n) refl = refl
