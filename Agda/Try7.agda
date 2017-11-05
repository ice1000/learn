module Try7 where

open import Data.Bool
open import Data.Nat
open import Data.String
open import Data.Fin
open import Data.Unit
open import Data.Empty

data ℤ : Bool → Set where
  zero : ℤ true
  z+1  : ℤ true  → ℤ true
  neg  : ℤ true  → ℤ false
  z-1  : ℤ false → ℤ false

data BinTree : Set where
  leaf : ℕ    → BinTree
  node : Bool → BinTree → BinTree → BinTree

data ListOfℕ : Set where
  Nil : ListOfℕ
  Suc : ListOfℕ → ℕ → ListOfℕ

data NonEmptyListOfℕ : Set where
  Suc : ListOfℕ → ℕ → NonEmptyListOfℕ

data A₀ (B : Set) : Set where
  someA₀ : B → A₀ B

data A₁ : (B : Set) → Set where
  someA₁ : A₁ ℕ → A₁ Bool

data L : Set
data M : Set

infixr 10 _::_

data L where
  nil  : L
  _::_ : ℕ → M → L

data M where
  _::_ : Bool → L → M

SomeList : L
SomeList = 10 :: true :: nil

data _⊎_ (A B : Set) : Set where
  inj₀ : A → A ⊎ B
  inj₁ : B → A ⊎ B

data Bool[] : Bool → Set where
  true  : ⊤ → Bool[] true
  false : ⊥ → Bool[] false

data ℕ[] : ℕ → Set where
  zero : ⊤ → ℕ[] zero
  even : ⊤ → (n : ℕ) → ℕ[] (suc (suc n))
  odd  : ⊥ → (n : ℕ) → ℕ[] (suc (suc n))

