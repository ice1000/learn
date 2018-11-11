module HoTTTest where

open import lib.Basics
open import lib.types.Nat

variable i : ULevel

infixr 5 _cat_
data Vec {i} (A : Type i) : Nat -> Type i where
  []    : Vec A O
  _cat_ : forall {n} -> A -> Vec A n -> Vec A (S n)

data Nullable {i} (A : Type i) : Type i where
  nullptr : Nullable A
  new_    : A -> Nullable A

module GetAtIndex where
  _!!_<[_]> : {A : Type i} -> forall {l} -> Vec A l
          -> (n : Nat) -> n < l -> A
  (x cat _) !! O <[ _ ]> = x
  (_ cat a) !! S n <[ p ]> = a !! n <[ <-cancel-S p ]>

  sampleList : Vec Nat 4
  sampleList = 0 cat 1 cat 2 cat 3 cat []

  _ : (sampleList !! 1 <[ ltSR (ltSR ltS) ]>) == 1
  _ = idp

  _ : (sampleList !! 2 <[ ltSR ltS ]>) == 2
  _ = idp

  lessThan : forall a b -> Nullable (a < b)
  lessThan O O = nullptr
  lessThan O (S b) = new O<S b 
  lessThan (S a) O = nullptr
  lessThan (S a) (S b) with lessThan a b
  ... | nullptr = nullptr
  ... | new x   = new <-ap-S x

  runtimeInput : forall {m} -> Vec Nat m -> Nat -> Nullable Nat
  runtimeInput [] _ = nullptr
  runtimeInput {m} v n with lessThan n m
  ... | nullptr = nullptr
  ... | new x   = new (v !! n <[ x ]>)

module Dynamic where
  data ???? : Type0 where ??? : ????
  open GetAtIndex

  returnType : (_ _ : Nat) -> Type0
  returnType O _ = ????
  returnType (S _) O = Nat
  returnType (S n) (S m) = returnType n m

  getAtIndex : forall {m} -> (v : Vec Nat m) -> (n : Nat) -> returnType m n
  getAtIndex [] _ = ???
  getAtIndex {S m} (x cat v) O = x
  getAtIndex {S m} (x cat v) (S n) = getAtIndex v n

  _ = idp :> (getAtIndex sampleList 2 == 2)
  _ = idp :> (getAtIndex sampleList 1 == 1)
  _ = idp :> (getAtIndex sampleList 233 == ???)
