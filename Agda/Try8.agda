module Try8 where

open import Data.Nat
open import Agda.Builtin.Equality
open import Data.Empty

postulate plus-comm : (a b : ℕ) → a + b ≡ b + a
postulate P : ℕ → Set

proof₀ : (a b : ℕ) → P (a + b) → P (b + a)
proof₀ a b t with   a + b  | plus-comm a b
...             | .(b + a) | refl = t

proof₁ : (a b : ℕ) → P (a + b) → P (b + a)
proof₁ a b t rewrite plus-comm a b = t

2≤10 : 2 ≤ 10
2≤10 = s≤s (s≤s z≤n)

10≰2 : 10 ≤ 2 → ⊥
10≰2 (s≤s (s≤s ()))

data _is-double-of_ : ℕ → ℕ → Set where
  0=0*2 : 0 is-double-of 0
  n=m*2 : ∀ {n m} → n is-double-of m → (suc (suc n)) is-double-of (suc m)

proof₂ : 8 is-double-of 4
proof₂ = n=m*2 (n=m*2 (n=m*2 (n=m*2 0=0*2)))

proof₃ : 9 is-double-of 4 → ⊥
proof₃ (n=m*2 (n=m*2 (n=m*2 (n=m*2 ()))))

data _is-odd : ℕ → Set where
  1%2=1 : 1 is-odd
  n%2=1 : ∀ {n} → n is-odd → (suc (suc n)) is-odd

proof₄ : 9 is-odd
proof₄ = n%2=1 (n%2=1 (n%2=1 (n%2=1 1%2=1)))

proof₅ : 8 is-odd → ⊥
proof₅ (n%2=1 (n%2=1 (n%2=1 (n%2=1 ()))))

proof₆ : ∀ {n} {a b : Set n} → a ≡ b → a → b
proof₆ ab a rewrite ab = a
