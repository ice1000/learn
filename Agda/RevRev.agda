module RevRev where

open import Data.Vec
open import Data.Nat
open import Agda.Builtin.Equality

rev : ∀ {n m} {A : Set n} → Vec A m → Vec A m
rev [] = []
rev (x ∷ xs) = rev xs ∷ʳ x

lemma : ∀ {n m} {A : Set n} (a : A) (v : Vec A m) → rev (v ∷ʳ a) ≡ a ∷ rev v
lemma _ [] = refl
lemma x (_ ∷ xs)
  rewrite lemma x xs
          = refl

rev∘rev=id : ∀ {n m} {A : Set n} (v : Vec A m) → rev (rev v) ≡ v
rev∘rev=id [] = refl
rev∘rev=id (x ∷ xs)
  rewrite lemma x (rev xs)
        | rev∘rev=id xs
          = refl
