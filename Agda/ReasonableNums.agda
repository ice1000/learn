module ReasonableNums where

open import Agda.Builtin.Nat renaming (Nat to ℕ)
open import Data.Empty
open import Agda.Builtin.Equality
open import Data.Product

data ℚ : (a b : ℕ) → Set where
  _÷_⟨_⟩ : (a b : ℕ) → ∃ (λ n → b ≡ suc n) → ℚ a b

_→ℕ : ∀ {a} → ℚ a 1 → ℕ
_→ℕ {a} _ = a

_÷0 : ∀ {a} → ℚ a 0 → ⊥
(a ÷ .0 ⟨ proj₃ , () ⟩) ÷0


