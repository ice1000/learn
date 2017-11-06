module A+B where

open import Data.List
open import Data.Nat
open import Agda.Builtin.Equality

a+0=0+a : ∀ a → a + 0 ≡ a
a+0=0+a  zero   = refl
a+0=0+a (suc a) rewrite a+0=0+a a = refl

++a+b=a+b++ : ∀ a b → suc a + b ≡ a + suc b
++a+b=a+b++  zero   b = refl
++a+b=a+b++ (suc a) b rewrite ++a+b=a+b++ a b = refl

a+b=b+a : ∀ a b → a + b ≡ b + a
a+b=b+a  zero     zero   = refl
a+b=b+a  zero sb@(suc b)
  rewrite a+0=0+a b
        | a+0=0+a sb
          = refl
a+b=b+a (suc a) b
  rewrite a+b=b+a a b
        | ++a+b=a+b++ b a
          = refl

rev : ∀ {n} {A : Set n} → List A → List A
rev [] = []
rev (x ∷ xs) = rev xs ++ [ x ]

lemma : ∀ {n} {A : Set n} (a : A) (v : List A) → rev (v ∷ʳ a) ≡ a ∷ rev v
lemma _ [] = refl
lemma x (_ ∷ xs)
  rewrite lemma x xs
          = refl

rev∘rev=id : ∀ {n} {A : Set n} (v : List A) → rev (rev v) ≡ v
rev∘rev=id [] = refl
rev∘rev=id (x ∷ xs)
  rewrite lemma x (rev xs)
        | rev∘rev=id xs
          = refl

