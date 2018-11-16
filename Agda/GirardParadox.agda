{-# OPTIONS --type-in-type   #-}
{-# OPTIONS --omega-in-omega #-}
module GirardParadox where

module TypeInType where

  data ⊥ : Set where
  data D : Set where c : (f : (A : Set) → A → A) → D

  empty : D → ⊥
  empty (c f) = empty (f D (c f))

  absurd : ⊥
  absurd = empty (c λ A x → x)

open import Agda.Primitive
