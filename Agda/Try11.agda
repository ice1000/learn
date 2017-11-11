module Try11 where

open import Agda.Builtin.Equality

证明 : ∀ {学习 不学习 进步 快乐 : Set} → 学习 ≡ 进步 → 不学习 ≡ 快乐 → 进步 ≡ 快乐 → 学习 ≡ 不学习
证明 refl refl refl = refl

postulate f : Set → Set

data ⊥ : Set₂ where

g : Set₂
g = ⊥
