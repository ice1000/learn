module Try7 where

open import Data.Bool
open import Data.Nat
open import Data.String
open import Data.Fin
open import Data.Unit
open import Data.Empty

data ℤ : Bool → Set where
  instance zero : ℤ true
  instance z+1  : ℤ true  → ℤ true
  instance neg  : ℤ true  → ℤ false
  instance z-1  : ℤ false → ℤ false

data BinTree : Set where
  instance leaf : ℕ    → BinTree
  instance node : Bool → BinTree → BinTree → BinTree

data ListOfℕ : Set where
  instance Nil : ListOfℕ
  instance Suc : ListOfℕ → ℕ → ListOfℕ

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
  instance inj₀ : A → A ⊎ B
  instance inj₁ : B → A ⊎ B

data Bool[] : Bool → Set where
  instance true  : ⊤ → Bool[] true
  instance false : ⊥ → Bool[] false

data ℕ[] : ℕ → Set where
  instance zero : ⊤ → ℕ[] zero
  instance even : ⊤ → (n : ℕ) → ℕ[] (suc (suc n))
  instance odd  : ⊥ → (n : ℕ) → ℕ[] (suc (suc n))

data SetAB (A B : Set) : Bool → Set where
  instance fromA : A → SetAB A B true
  instance fromB : B → SetAB A B false

