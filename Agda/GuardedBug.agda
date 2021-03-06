{-# OPTIONS --cubical --no-sized-types --guardedness --safe #-}
module GuardedBug where
record Stream (A : Set) : Set where
  coinductive
  field head : A
  field tail : Stream A
open Stream

data A : Set where a : A

someA : Stream A
head someA = a
tail someA = someA -- termination check failed
