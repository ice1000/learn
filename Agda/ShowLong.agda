module ShowLong where

open import Agda.Builtin.Nat renaming (suc to 1+)

fact : Nat -> Nat
fact zero = 1
fact (1+ n) = fact n * 1+ n

data BinTree : Set where
  leaf : Nat -> BinTree
  node : BinTree -> BinTree -> Nat -> BinTree

sum : BinTree -> Nat
sum (leaf x) = x
sum (node a b x) = sum a + sum b + x

sampleTree = node (leaf 10) (leaf 20) 25
complicatedTree = node sampleTree sampleTree 20

