{-# OPTIONS --termination-depth=100 #-}
module TerminationCheck where

open import lib.Basics

_/2 : Nat -> Nat
O /2 = O
S O /2 = O
S (S n) /2 = S (n /2)

--- Still failing
wrong : Nat -> Nat
wrong O = O
wrong n@(S _) = wrong (n /2)

