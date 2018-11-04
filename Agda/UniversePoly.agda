{-# OPTIONS --omega-in-omega #-}

module UniversePoly where

open import Level
open import Function
open import Agda.Primitive

set2 : Set₁
set2 = Set → Set

set3 : Set₃
set3 = Set₂ → Set₂

levelArith : Setω
levelArith = (n : Level) → Set n
