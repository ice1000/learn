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
Bool≡[Bool≡Bool] = ua (isoToEquiv (iso (f ∘ lower) (lift ∘ g) sec ret))
  where
  f : Bool → Bool ≡ Bool
  f false = refl
  f true = notEq

  g : Bool ≡ Bool → Bool
  g idp = transport idp false

  ret : ∀ b → lift (g ∘ f $ lower b) ≡ b
  ret (lift false) = refl
  ret (lift true) = refl

  sec : ∀ idp → f (g idp) ≡ idp
  -- f (transport idp false) ≡ idp
  sec idp = {!!}
    where
    lemma′ : ua (pathToEquiv idp) ≡ idp
    lemma′ = secEq univalence idp

    h : Bool → Bool
    h = transport idp

    bi : (idp ≡ notEq) ⊎ (idp ≡ refl)
    bi with h true | h false | inspect h true | inspect h false
    bi | false | false | [ p ] | [ p′ ] = {!!}
    bi | false | true | [ p ] | [ p′ ] = {!inl (sym lemma′ ∙ cong ua λ i → h=not i , {!!})!}
      where
      h=not : h ≡ not
      h=not = funExt λ { true → p; false → p′ }
    bi | true | false | [ p ] | [ p′ ] = inr {!!}
      where
      h=id : h ≡ id
      h=id = funExt λ { true → p; false → p′ }
    bi | true | true | [ p ] | [ p′ ] = {!!}
