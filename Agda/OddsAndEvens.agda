{-# OPTIONS --safe #-}
module OddsAndEvens where

open import Data.Nat renaming (ℕ to Nat)

data Even : Nat → Set
data Odd  : Nat → Set

data Even where
  zero : Even zero
  suc  : ∀ {n : Nat} → Odd n → Even (suc n)

data Odd where
  suc : ∀ {n : Nat} → Even n → Odd (suc n)

-- | Implement all these functions
infixl 6 _e+e_ _o+e_ _o+o_ _e+o_
_e+e_ : ∀ {m n : Nat} → Even m → Even n → Even (m + n)
_o+o_ : ∀ {m n : Nat} → Odd  m → Odd  n → Even (m + n)
_o+e_ : ∀ {m n : Nat} → Odd  m → Even n → Odd  (m + n)
_e+o_ : ∀ {m n : Nat} → Even m → Odd  n → Odd  (m + n)
zero e+e b = b
suc x e+e b = suc (x o+e b)
suc x o+e b = suc (x e+e b)
suc x o+o y = suc (x e+o y)
zero e+o y = y
suc x e+o y = suc (x o+o y)

infixl 7 _e*e_ _o*e_ _o*o_ _e*o_
_e*e_ : ∀ {m n : Nat} → Even m → Even n → Even (m * n)
_o*e_ : ∀ {m n : Nat} → Odd  m → Even n → Even (m * n)
_o*o_ : ∀ {m n : Nat} → Odd  m → Odd  n → Odd  (m * n)
_e*o_ : ∀ {m n : Nat} → Even m → Odd  n → Even (m * n)
zero e*e b = zero
suc x e*e b = b e+e x o*e b
suc x o*e b = b e+e x e*e b
zero e*o b = zero
suc x e*o b = b o+o x o*o b
suc x o*o b = b o+e x e*o b
