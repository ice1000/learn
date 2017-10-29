module Try3 where

open import Data.Bool
open import Data.Nat
open import Agda.Primitive

data _even : ℕ → Set where
  ZERO : zero even
  STEP : ∀ x → x even → suc (suc x) even

data _is-even : ℕ → Set where
  𝟘   : zero is-even
  #_ : ∀ {x} → x is-even → suc (suc x) is-even
  -- #_ : (x : ℕ) → x is-even → suc (suc x) is-even

proof₀ : suc (suc (suc (suc zero))) even
proof₀ = STEP 2 (STEP zero ZERO)

proof₁ : suc (suc (suc (suc zero))) even
proof₁ = STEP _ (STEP _ ZERO)

𝟚 : suc (suc zero) is-even
𝟚 = # 𝟘

𝟜 : suc (suc (suc (suc zero))) is-even
𝟜 = # 𝟚
-- 𝟜 = # # 𝟘

proof₂ : {a : Set} → a → a
proof₂ = λ z → z
