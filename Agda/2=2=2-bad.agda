{-# OPTIONS --cubical --safe #-}
module 2=2=2 where

open import Cubical.Core.Everything
open import Cubical.Foundations.Everything
open import Cubical.Data.Bool
open import Cubical.Data.Sum
open import Cubical.Data.Empty
open import Cubical.Data.Unit
open import Function hiding (_∘_)

-- abstract notEq = notEq′

-- maybe helpful when case splitting
record Reveal_·_is_ {a b} {A : Set a} {B : A → Set b}
                    (f : (x : A) → B x) (x : A) (y : B x) :
                    Set (ℓ-max a b) where
  constructor [_]′
  inductive
  field eq : f x ≡ y

inspect : ∀ {a b} {A : Set a} {B : A → Set b}
          (f : (x : A) → B x) (x : A) → Reveal f · x is f x
inspect f x = [ refl ]′

-- Lift is necessary for Bool and Bool ≡ Bool are of different level. :-P
Bool≡[Bool≡Bool] : Lift Bool ≡ (Bool ≡ Bool)
Bool≡[Bool≡Bool] = ua (isoToEquiv (iso (f ∘ lower) (lift ∘ g) sec ret))
  where
  f : Bool → Bool ≡ Bool
  f false = refl
  f true = notEq

  g : Bool ≡ Bool → Bool
  g idp = transport idp false

  ret : ∀ b → lift (g ∘ f $ lower b) ≡ b
  ret (lift false) = refl
  ret (lift true) = refl -- TODO

  sec : ∀ idp → f (g idp) ≡ idp
  -- f (transport idp false) ≡ idp
  sec idp = {!!}
    where
    lemma′ : ua (pathToEquiv idp) ≡ idp
    lemma′ = secEq univalence idp

    h : Bool → Bool
    h = transport idp

    diag : Bool → Set
    diag false = ⊥
    diag true = Unit

    absurdity : true ≡ false → ⊥
    absurdity p = transport (cong diag p) tt

    bi : (idp ≡ notEq) ⊎ (idp ≡ refl)
    bi with h true | h false | inspect h true | inspect h false
    bi | false | false | [ p ]′ | [ p′ ]′ = ⊥-elim {!absurdity!}
      where
      secg : ∀ b → b ≡ g false
      secg false = (sym (sec false)) ∙ (cong f p′)
      secg true = (sym (sec true)) ∙ (cong f p)

    bi | false | true | [ p ]′ | [ p′ ]′ = inl (sym lemma′ ∙ lemma2)
      where
      h=not : h ≡ not
      h=not = funExt λ { true → p; false → p′ }

      lemma2 : ua (pathToEquiv idp) ≡ notEq
      lemma2 = cong ua (equivEq (pathToEquiv idp) notEquiv h=not)

    bi | true | false | [ p ]′ | [ p′ ]′ = inr {!!}
      where
      h=id : h ≡ id
      h=id = funExt λ { true → p; false → p′ }
    bi | true | true | [ p ]′ | [ p′ ]′ = {!!}
