module QSort where

open import Data.Nat

record SList {a} (A : Set a) : Set a where
  coinductive
  constructor _∷_
  field
    head : A
    tail : SList {a} A

open SList

  module List where
  import Data.List

  module Vec where
  import Data.Vec



