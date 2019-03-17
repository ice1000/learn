{-# OPTIONS --cubical --safe #-}
module 2=2=2 where

open import Cubical.Core.Everything
open import Cubical.Foundations.Univalence
open import Cubical.Foundations.Equiv
open import Cubical.Data.Everything
open import Function

-- maybe helpful when case splitting
record Reveal_·_is_ {a b} {A : Set a} {B : A → Set b}
                    (f : (x : A) → B x) (x : A) (y : B x) :
                    Set (ℓ-max a b) where
  constructor [_]
  inductive
  field eq : f x ≡ y

inspect : ∀ {a b} {A : Set a} {B : A → Set b}
          (f : (x : A) → B x) (x : A) → Reveal f · x is f x
inspect f x = [ refl ]

-- Lift is necessary for Bool and Bool ≡ Bool are of different level. :-P
Bool≡[Bool≡Bool] : Lift Bool ≡ (Bool ≡ Bool)
Bool≡[Bool≡Bool] = ua (isoToEquiv (iso (ua ∘ f ∘ lower) (lift ∘ g) sec ret))
  where
  f : Bool → Bool ≃ Bool
  f false = idEquiv Bool
  f true = notEquiv

  g : Bool ≡ Bool → Bool
  g idp = transport idp false

  sec : ∀ idp → ua (f $ g idp) ≡ idp
  -- f (transport idp false) ≡ idp
  sec idp = cong ua {!!} ∙ lemma
    where
    lemma : ua (pathToEquiv idp) ≡ idp
    lemma = secEq univalence idp

    bi : (idp ≡ notEq) ⊎ (idp ≡ refl)
    bi = {!!}

  ret : ∀ b → lift (g ∘ ua ∘ f $ lower b) ≡ b
  ret (lift false) = refl
  ret (lift true) = refl
