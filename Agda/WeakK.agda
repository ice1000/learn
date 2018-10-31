{-# OPTIONS --prop #-}
{-# OPTIONS --with-K #-}
module WeakK where

open import lib.Basics

variable
  i : ULevel
  A : Type i

-- | This is K
K : (P : A == A -> Prop) (p : P idp) (e : A == A) -> P e
K P p idp = p

eq = Path {_} {Nat == Nat} idp idp

-- | This is a weaker version of K
--   If we only disable deletion rule during unification,
--   this code will be accepted, which is what we don't want
weakK : (P : Path {lsucc i} {A == A} idp idp -> Prop)
        (p : P idp) (e : idp == idp) -> P e
weakK P p idp = p
