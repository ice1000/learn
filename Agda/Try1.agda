module Try1 where

data Bool : Set where
  true false : Bool

data ℕ : Set where
  zero : ℕ
  succ : ℕ → ℕ

data Id (A : Set) : Set where
  pack : A → Id A

data ⊥ : Set where

idℕ₀ : ℕ → ℕ
idℕ₀ x = x

id₁ : {A : Set} → A → A
id₁ {A} a = a

-- idTester₁ : ℕ → ℕ
-- idTester₁ : id₁ {ℕ}

id₃ : {A : Set} (a : A) → A
id₃ a = a

unpack : ∀ {A} → Id A → A
unpack (pack a) = a

unpack₁ : ∀ A → Id A → A
unpack₁ _ (pack a) = a

if_then_else_ : {A : Set} → Bool → A → A → A
if true  then a else _ = a
if false then _ else a = a
