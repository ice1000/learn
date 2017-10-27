module Try2 where

data 𝕟 : Set where
  zero : 𝕟
  succ : 𝕟 → 𝕟

_$₀_ : {A B : Set} → (A → B) → A → B
f $₀ a = f a

_$₁_ : {A : Set} {B : A → Set} → ((a : A) → B a) → (x : A) → B x
f $₁ a = f a

infixl 0 _$₀_
infixl 0 _$₁_

_+₀_ : 𝕟 → 𝕟 → 𝕟
zero     +₀ zero = zero
zero     +₀ n    = n
(succ n) +₀ n′   = succ $₀ n +₀ n′

_+₁_ : 𝕟 → 𝕟 → 𝕟
zero     +₁ zero = zero
zero     +₁ n    = n
(succ n) +₁ n′   = succ $₁ n +₁ n′

