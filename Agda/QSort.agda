{-# OPTIONS --prop #-}
module QSort where

open import Data.Nat
open import Data.Sum
open import Data.Bool
open import Data.Unit using (⊤; tt)
open import Data.List
open import Level
open import Relation.Binary.PropositionalEquality

variable
  ℓ : Level

-- record SList (A : Set ℓ) : Set ℓ where
--   coinductive
--   constructor _∷_
--   field
--     head : A
--     tail : SList {ℓ} A

-- open SList

data SList {ℓ} (A : Set ℓ) (lt : A -> A -> Set) : Set ℓ

ltProof : ∀ {A : Set ℓ} {lt} -> A -> SList A lt -> Set

infixr 5 _∷_⟨_⟩
data SList A lt where
  []  : SList A lt
  _∷_⟨_⟩ : (a : A) -> (as : SList A lt) -> .(ltProof a as) -> SList A lt

ltProof a [] = ⊤
ltProof {_} {_} {lt} a (a₁ ∷ as ⟨ _ ⟩) = lt a a₁

simpleSList : SList ℕ _≤_
simpleSList =
  0 ∷ 1 ∷ 2 ∷ 10 ∷ [] ⟨ tt ⟩ ⟨ s≤s (s≤s z≤n) ⟩ ⟨ s≤s z≤n ⟩ ⟨ z≤n ⟩

qsort : List ℕ -> SList ℕ _≤_
qsort [] = []
qsort (a ∷ as) = {!!}

infix 4 _≡′_
data _≡′_ {a} {A : Set a} (x : A) : A → Prop a where
  instance refl : x ≡′ x

f : 1 ≡′ 1 → ⊤
f a = tt
