{-# OPTIONS --safe #-}
module ++-Injective where

open import Relation.Binary.PropositionalEquality using (refl; _≡_; sym)
open import Data.List
open import Data.List.Properties
open import Level
-- you can import other functions from the stdlib here

variable
  ℓ : Level
  A : Set ℓ

++-injectiveʳ : (a b c : List A) → a ++ b ≡ a ++ c → b ≡ c
++-injectiveʳ [] b c p = p
++-injectiveʳ (x ∷ a) b c p = ++-injectiveʳ a b c (lemma a b c p)
  where lemma : ∀ {x} → (a b c : List A) → x ∷ a ++ b ≡ x ∷ a ++ c → a ++ b ≡ a ++ c
        lemma [] b .b refl = refl
        lemma (x ∷ a) b c p rewrite ∷-injectiveʳ p = refl

-- pretty hard
-- try to use cong to convert to an eazier problem
++-injectiveˡ : ∀ {ℓ} {A : Set ℓ} (a b c : List A) → a ++ c ≡ b ++ c → a ≡ b
++-injectiveˡ a b [] p rewrite ++-identityʳ a | ++-identityʳ b = p
++-injectiveˡ a b (x ∷ c) p
  rewrite sym (++-assoc a [ x ] c)
        | sym (++-assoc b [ x ] c)
        = ∷ʳ-injectiveˡ a b (++-injectiveˡ (a ∷ʳ x) (b ∷ʳ x) c p)
