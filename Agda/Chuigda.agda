{-# OPTIONS --no-unicode #-}
{-# OPTIONS --without-K  #-}
module Chuigda where

open import lib.Basics

variable i : ULevel

postulate
  funcEq : {A B : Type i} {P Q : (A -> B)} (a : A)
        -> (P a == Q a) -> P == Q
  funcEq' : {A B : Type i} {P Q : (A -> B)}
         -> ((a : A) -> P a == Q a) -> P == Q
  emptyEq : {A : Type i} (a b : ¬ A) -> (a == b)

theorem : {A B : Type i} -> Dec A -> (A -> B) == (¬ A ⊔ B)
theorem {i} {A} {B} decA = ua $ equiv f g (f-g' decA) (g-f' decA)
  where
    f' : (Dec A) -> (A -> B) -> (¬ A ⊔ B)
    f' (inl a) fn = inr $ fn a
    f' (inr na) _ = inl na
    f = f' decA

    g : (¬ A ⊔ B) -> (A -> B)
    g (inl na) = Empty-elim ∘ na
    g (inr b) = cst b

    g-f' : (decA : Dec A) -> forall x -> g (f' decA x) == x
    g-f' (inl a) _ = funcEq a idp
    g-f' (inr na) x = funcEq' $ Empty-elim {i}
         {cst (Empty-elim (na _) == x _)} ∘ na

    f-g' : (decA : Dec A) -> forall x -> f' decA (g x) == x
    f-g' (inl a) (inl x) = Empty-elim {i}
         {cst (inr (Empty-elim (x a)) == inl x)} (x a)
    f-g' (inl _) (inr _) = idp
    f-g' (inr na) (inl x) rewrite emptyEq na x = idp
    f-g' (inr na) (inr x) = Empty-elim {i} {cst (inl na == inr x)} {!!}
