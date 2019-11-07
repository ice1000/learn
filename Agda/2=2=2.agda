{-# OPTIONS --cubical --safe #-}

open import Cubical.Core.Everything
open import Cubical.Data.Sum
open import Cubical.Data.Bool
open import Cubical.Foundations.Everything
open import Cubical.Data.Empty
open import Cubical.Data.Unit

compPath = _∙_

record Reveal_·_is_ {a b} {A : Set a} {B : A → Set b}
                    (f : (x : A) → B x) (x : A) (y : B x) :
                    Set (ℓ-max a b) where
  constructor [_]
  field eq : f x ≡ y

inspect : ∀ {a b} {A : Set a} {B : A → Set b}
          (f : (x : A) → B x) (x : A) → Reveal f · x is f x
inspect f x = [ refl ]

module _ (a : Bool ≡ Bool) where

  private
   g = transport a
   f = invEq (transportEquiv a)

   sec : section f g
   sec = secEq (transportEquiv a)

   ret : retract f g
   ret = retEq (transportEquiv a)

  ll : (a ≡ notEq) ⊎ (a ≡ refl)
  ll with g true | g false | inspect g true | inspect g false
  ll | false | true | [ p1 ] | [ p2 ] =
    inl (compPath (sym lemma1) lemma2)
    where
      g=not : g ≡ not
      g=not = funExt (λ { false → p2
                        ; true → p1
                        })

      lemma1 : ua (pathToEquiv a) ≡ a
      lemma1 = secEq univalence a

      lemma2 : ua (pathToEquiv a) ≡ notEq
      lemma2 = cong ua (equivEq (pathToEquiv a) notEquiv g=not)

  ll | true | false | [ p1 ] | [ p2 ] = inr (compPath (sym lemma1) lemma2)
    where
      g=id : g ≡ idfun Bool
      g=id = funExt (λ { false → p2
                        ; true → p1
                        })

      lemma1 : ua (pathToEquiv a) ≡ a
      lemma1 = secEq univalence a

      lemma2 : ua (pathToEquiv a) ≡ refl
      lemma2 = compPath (cong ua (equivEq (pathToEquiv a) (idEquiv Bool) g=id))
        uaIdEquiv

  ll | false | false | [ p1 ] | [ p2 ] = ⊥-elim (tobot _)
    where
      secg : ∀ b → b ≡ f false
      secg false = compPath (sym (sec false)) (cong f p2)
      secg true =  compPath (sym (sec true)) (cong f p1)

      true≡false : true ≡ false
      true≡false = compPath (secg true) (sym (secg false))

      tobot : Unit → ⊥
      tobot = transport (cong helper true≡false)
        where
          helper : Bool → Set
          helper true = Unit
          helper false = ⊥

  ll | true | true | [ p1 ] | [ p2 ] = ⊥-elim (tobot _)  
    where
      secg : ∀ b → b ≡ f true
      secg false = compPath (sym (sec false)) (cong f p2)
      secg true =  compPath (sym (sec true)) (cong f p1)

      true≡false : true ≡ false
      true≡false = compPath (secg true) (sym (secg false))

      tobot : Unit → ⊥
      tobot = transport (cong helper true≡false)
        where
          helper : Bool → Set
          helper true = Unit
          helper false = ⊥

b→b=b : ∀ {j} → Lift {j = j} Bool → Bool ≡ Bool
b→b=b (lift false) = refl
b→b=b (lift true) = notEq

b=b→b : ∀ {j} → Bool ≡ Bool → Lift {j = j} Bool
b=b→b idp with ll idp
b=b→b idp | inl x = lift true
b=b→b idp | inr x = lift false

Bool≡[Bool≡Bool] : Lift Bool ≡ (Bool ≡ Bool)
Bool≡[Bool≡Bool] = isoToPath (iso b→b=b b=b→b sec ret)
  where
  sec : section b→b=b b=b→b
  sec idp with ll idp
  sec idp | inl x = sym x
  sec idp | inr x = sym x

  ret : retract b→b=b b=b→b
  ret (lift false) = refl
  ret (lift true) = refl

