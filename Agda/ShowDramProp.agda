{-# OPTIONS --without-K #-}
{-# OPTIONS --prop      #-}
module ShowDramProp where

postulate
  SomeProp : Prop
  SomeProof AnotherProof : SomeProp

data _==_ {A : Prop} (x : A) : A -> Set where
  refl : x == x

_ : SomeProof == AnotherProof
_ = refl

const : SomeProp -> SomeProp -> SomeProp
const a _ = a

f = const SomeProof
g = const AnotherProof
