{-# OPTIONS --safe #-}

module AdHoc where

open import Data.Char
open import Data.String hiding (length)
open import Data.List
open import Data.Integer as I
open import Data.Nat as N
open import Agda.Builtin.Nat using (_==_)
open import Data.Bool as B
open import Function
open import Relation.Nullary

record Eq (A : Set) : Set where
  inductive
  constructor eq
  field _===_ : A → A → Bool
  _=/=_ : A → A → Bool
  a =/= b = not (a === b)

module Instances where
  open Eq
  instance
    IntEq : Eq ℤ
    _===_ IntEq a b with a I.≟ b
    (IntEq === a) b | yes p = true
    (IntEq === a) b | no ¬p = false

    NatEq : Eq ℕ
    _===_ NatEq a b = a == b

    CharEq : Eq Char
    _===_ CharEq a b = toNat a == toNat b

    StrEq : Eq String
    _===_ StrEq a b = primStringEquality a b

    BoolEq : Eq Bool
    _===_ BoolEq a b with a B.≟ b
    (BoolEq === a) b | yes p = true
    (BoolEq === a) b | no ¬p = false

open Instances public
open Eq {{ ... }} public

module ListInstance where
  ListEq : {A : Set} → {{ _ : Eq A }} → Eq (List A)
  Eq._===_ ListEq a b = (length a === length b) ∧ (foldr _∧_ true (zipWith _===_ a b))
