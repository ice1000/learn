-- https://twitter.com/YuumuKonpaku/status/1052959340468953088
module YuumuTwitter where

open import lib.Basics

infix 10 _∨_
data _∨_ {a b} (A : Type a) (B : Type b) : Set (lmax a b) where
  a-intro : A -> A ∨ B
  b-intro : B -> A ∨ B

test : (x y : ℕ) -> (x == y ∨ x ≠ y)
test O O = a-intro idp
test O (S y) = b-intro (λ ())
test (S x) O = b-intro (λ ())
test (S x) (S y) with test x y
... | a-intro idp = a-intro idp
... | b-intro k = b-intro (lemma k)
  where
    lemma : {a b : ℕ} -> a ≠ b -> S a ≠ S b
    lemma p idp = p idp

