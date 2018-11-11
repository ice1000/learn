{-# OPTIONS --no-unicode #-}
{-# OPTIONS --without-K  #-}
{-# OPTIONS --prop       #-}
module Chuigda-prop where

open import lib.Basics hiding (¬; ⊥; ⊥-elim; Empty; Empty-elim; Coprod; _⊔_; Dec; _$_; _∘_; cst; Π; ua)

variable i : ULevel

data Empty : Prop where
neg : (A : Prop i) -> Prop i
neg A = A -> Empty
Empty-elim : {P : Empty -> Prop i} -> ((x : Empty) -> P x)
Empty-elim ()
data _=='_ {i} {A : Prop i} (x : A) : A -> Prop i where
  refl : x ==' x

data Coprod {i j} (A : Prop i) (B : Prop j) : Prop (lmax i j) where
  inl : A → Coprod A B
  inr : B → Coprod A B

infixr 80 _⊔_
_⊔_ = Coprod

Dec : ∀ {i} (P : Prop i) → Prop i
Dec P = Coprod P (neg P)

Π : ∀ {i j} (A : Prop i) (P : A → Prop j) → Prop (lmax i j)
Π A P = (x : A) → P x

cst : ∀ {i j} {A : Prop i} {B : Prop j} (b : B) → (A -> B)
cst b = λ _ → b

infixr 80 _∘_

_∘_ : ∀ {i j k} {A : Prop i} {B : A → Prop j} {C : (a : A) → (B a → Prop k)}
  → (g : {a : A} → Π (B a) (C a)) → (f : Π A B) → Π A (λ a → C a (f a))
g ∘ f = λ x → g (f x)

-- Application
infixr 0 _$_
_$_ : ∀ {i j} {A : Prop i} {B : A → Prop j} → (∀ x → B x) → (∀ x → B x)
f $ x = f x

postulate
  funcEq : {A B : Prop i} {P Q : (A -> B)} (a : A)
        -> (P a ==' Q a) -> P ==' Q
  funcEq' : {A B : Prop i} {P Q : (A -> B)}
         -> ((a : A) -> P a ==' Q a) -> P ==' Q

postulate  -- Univalence axiom
  ua : ∀ {i} {A B : Prop i} → (A ≃ B) → A == B

emptyEq : {A : Prop i} (a b : neg A) -> (a ==' b)
emptyEq a b = ?

theorem : {A B : Prop i} -> Dec A -> (A -> B) == (neg A ⊔ B)
theorem {i} {A} {B} decA = ua $ equiv f g (f-g' decA) (g-f' decA)
  where
    f' : (Dec A) -> (A -> B) -> (neg A ⊔ B)
    f' (inl a) fn = inr $ fn a
    f' (inr na) _ = inl na
    f = f' decA

    g : (neg A ⊔ B) -> (A -> B)
    g (inl na) = Empty-elim ∘ na
    g (inr b) = cst b

    g-f' : (decA : Dec A) -> forall x -> g (f' decA x) ==' x
    g-f' (inl a) _ = funcEq a ?
    g-f' (inr na) x = funcEq' $ Empty-elim {i}
         {?} ∘ na

    f-g' : (decA : Dec A) -> forall x -> f' decA (g x) ==' x
    f-g' (inl a) (inl x) = Empty-elim {i}
         {?} (x a)
    f-g' (inl _) (inr _) = ?
    f-g' (inr na) (inl x) = ?
    f-g' (inr na) (inr x) = ?
