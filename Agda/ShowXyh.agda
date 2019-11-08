module ShowXyh where

open import Data.Product
open import Relation.Binary.PropositionalEquality
open import Function

postulate Mor : Set

Good = (a b : Mor) -> a ≡ b
Bad = ∃ λ a -> (b : Mor) -> a ≡ b
proof : Good -> Bad
proof good = {!!}

fine : Bad -> Good
fine (fst , snd) = λ a → trans (sym (snd a)) ∘ snd


