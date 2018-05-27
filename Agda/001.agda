module Try where

data Bool : Set where
  true false : Bool

data 𝕟 : Set where
  zero : 𝕟
  succ : 𝕟 → 𝕟

data Id (A : Set) : Set where
  pack : A → Id A

data ⊥ : Set where

id𝕟₀ : 𝕟 → 𝕟
id𝕟₀ x = x

id₁ : {A : Set} → A → A
id₁ {A} a = a

idTest₁ : 𝕟 → 𝕟
idTest₁ : id₁ {𝕟}

id₃ : {A : Set} (a : A) → A
id₃ a = a

unpack : ∀ {A} → Id A → A
unpack (pack a) = a

unpack₁ : ∀ A → Id A → A
unpack₁ _ (pack a) = a

if_then_else_ : {A : Set} → Bool → A → A → A
if true  then a else _ = a
if false then _ else a = a
