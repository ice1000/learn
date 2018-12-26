{-# OPTIONS --cubical #-}

module HitInt where

open import Agda.Builtin.Cubical.Path
open import Agda.Builtin.Cubical.Id
open import Agda.Primitive.Cubical

data ℕ : Set where
  zero : ℕ
  suc  : ℕ → ℕ

_:+:_ : ℕ → ℕ → ℕ
zero :+: b = b
suc a :+: b = suc (a :+: b)

_×_ : ℕ → ℕ → ℕ
zero × _ = zero
suc a × b = b :+: (a × b)

data ℤ : Set where
  pos : (n : ℕ) → ℤ
  neg : (n : ℕ) → ℤ
  zeroEq : pos zero ≡ neg zero

sucℤ : ℤ → ℤ
sucℤ (pos n) = pos (suc n)
sucℤ (neg zero) = pos (suc zero)
sucℤ (neg (suc n)) = neg n
sucℤ (zeroEq x) = pos (suc zero)

preℤ : ℤ → ℤ
preℤ (pos zero) = neg (suc zero)
preℤ (pos (suc n)) = pos n
preℤ (neg n) = neg (suc n)
preℤ (zeroEq x) = neg (suc zero)

_+_ : ℤ → ℤ → ℤ
pos zero + b = b
pos (suc n) + b = sucℤ (pos n + b)
neg zero + b = b
neg (suc n) + b = preℤ (neg n + b)
zeroEq _ + b = b

testInt : pos zero ≡ neg zero
testInt = zeroEq

testInt′ : preℤ (pos (suc zero)) ≡ neg zero
testInt′ = zeroEq

refl : ∀ {ℓ} {A : Set ℓ} (x : A) → Id x x
refl x = conid i1 (λ _ → x)

_==_ = Id

testInt′′ : preℤ (pos zero) == neg (suc zero)
testInt′′ = refl (neg (suc zero))

data ℚ : Set where
  _÷_ : (a b : ℕ) → ℚ
  divEq : (a b c : ℕ)
    → a ÷ b ≡ (a × c) ÷ (b × c)

one = suc zero
two = suc one
four = suc (suc two)

testQuo : (two ÷ one) ≡ (four ÷ two)
testQuo = divEq two one two

