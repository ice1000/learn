{-# OPTIONS --without-K #-}
module withoutK where

open import Data.Unit
open import Data.Nat
open import Data.Bool
open import Relation.Binary.PropositionalEquality 

-- k : {A : Set} {a : A} (P : a ≡ a -> Set)
--   -> P refl -> (e : a ≡ a) -> P e
-- k P p e = p

-- id-unique : {A : Set} {a b : A} -> (x : a ≡ b) -> (y : a ≡ b) -> x ≡ y
-- id-unique refl p2 = {!!}

hentai : {A : Set} -> let a = 23 in a ≡ a -> ⊤
hentai refl = tt

bool-kksk : ∀ {A : Set} -> A ≡ Bool -> ⊤
bool-kksk refl = tt

bool-kksk-specialized : Bool ≡ Bool -> ⊤
bool-kksk-specialized = bool-kksk

-- kksk : ∀ 
