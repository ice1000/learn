{-# OPTIONS --safe #-}
module ++-Identity where

open import Data.Nat
open import Data.Nat.Properties
open import Relation.Binary.HeterogeneousEquality
open import Data.Vec

++-identityʳ : ∀ {n} {A : Set} (xs : Vec A n) → xs ++ [] ≅ xs
++-identityʳ [] = refl
++-identityʳ (_ ∷ _) = icong (Vec _) (+-identityʳ _) (_ ∷_) (++-identityʳ _)
