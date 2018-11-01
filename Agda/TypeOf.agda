{-# OPTIONS --prop #-}
module TypeOf where

open import lib.Base

typeOf : ∀ {i} -> {A : Set i} -> A -> Set i
typeOf {_} {A} _ = A

propOf : ∀ {i} -> {A : Prop i} -> A -> Prop i
propOf {_} {A} _ = A
