module TrySigma where

open import Agda.Builtin.Sigma
open import Relation.Binary.PropositionalEquality
open import Data.Nat
open import Data.Fin using (Fin; zero; suc)
open import Data.List using (List; []; _∷_; _++_)
open import Data.Maybe using (Maybe; just; nothing)
open import Function

-- open Relation.Binary.PropositionalEquality.≡-Reasoning

Fin′ : ℕ → Set
Fin′ n = Σ ℕ (λ x → x < n)

toFin : ∀ {n} → Fin′ n → Fin n
toFin (zero , s≤s z≤n) = zero
toFin (suc f , s≤s s) = suc $ toFin $ f , s

data _∈_ {A : Set} (x : A) : List A → Set where
  first : {xs : List A} → x ∈ x ∷ xs
  later : {y : A} {xs : List A} → x ∈ xs → x ∈ y ∷ xs

infix 4 _∈_

_!_ : ∀ {A : Set} → List A → ℕ → Maybe A
[] ! _           = nothing
(x ∷ xs) ! zero    = just x
(x ∷ xs) ! (suc n) = xs ! n

infix 5 _!_

lookup : ∀ {A} {x : A} (xs : List A) → x ∈ xs → Σ ℕ (λ n → xs ! n ≡ just x)
lookup .(_ ∷ _) first = zero , refl
lookup {A} (_ ∷ xs) (later ex) =
  let i = lookup xs ex in (suc $ fst i) , trans (snd i) refl
-- where
--   lemma : xs ! fst (lookup xs ex) ≡ (x ∷ xs) ! (suc $ fst $ lookup xs ex)
--   lemma = refl
