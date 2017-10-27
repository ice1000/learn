-- | 𝔸𝕘𝕕𝕒 𝕚𝕤 𝕡𝕠𝕨𝕖𝕣𝕗𝕦𝕝
module Try2 where

data ?? : Set where
  √ : ??
  × : ??

_¿_∶_ : {A : Set} → ?? → A → A → A
√ ¿ a ∶ _ = a
× ¿ _ ∶ a = a

data ℕ : Set where
  𝟘   : ℕ
  ++_ : ℕ → ℕ

data Vec (A : Set) : ℕ → Set where
  []   : Vec A 𝟘
  _::_ : ∀ {n} (x : A) (xs : Vec A n) → Vec A (++ n)

infixr 5 _::_

_$₀_ : {A B : Set} → (A → B) → A → B
f $₀ a = f a

_$₁_ : {A : Set} {B : A → Set} → ((a : A) → B a) → (x : A) → B x
f $₁ a = f a

infixl 0 _$₀_
infixl 0 _$₁_

_∘_ : {A : Set} {B : A → Set} {C : (x : A) → B x → Set} (f : {x : A} (y : B x) → C x y) (g : (x : A) → B x) (x : A) → C x (g x)
f ∘ g = λ x → f $₁ g x
-- g x is  impossible
-- f ∘ g = λ x → f $₀ g x

plus2₀ : ℕ → ℕ
plus2₀ a = ++ ++ a

plus′ : ℕ → ℕ
plus′ a = ++ a

plus2₁ : ℕ → ℕ
plus2₁ = plus′ ∘ plus′

_+₀_ : ℕ → ℕ → ℕ
𝟘     +₀ 𝟘  = 𝟘
𝟘     +₀ n  = n
-- B is ℕ, so possible
(++ n) +₀ n′ = plus′ $₀ n +₀ n′

_+₁_ : ℕ → ℕ → ℕ
𝟘     +₁ 𝟘   = 𝟘
𝟘     +₁ n   = n
(++ n) +₁ n′ = plus′ $₁ n +₁ n′
