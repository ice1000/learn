module TrySumCW where

open import Agda.Builtin.Nat renaming (suc to S; zero to Z)
open import Agda.Builtin.Equality

sumSimple : (Nat -> Nat) -> Nat -> Nat
sumSimple _ Z = Z
sumSimple f (S n) = f (S n) + sumSimple f n

sumAux : Nat -> (Nat -> Nat) -> Nat -> Nat
sumAux acc _ Z = acc
sumAux acc f (S n) = sumAux (f (S n) + acc) f n

sumTail : (Nat -> Nat) -> Nat -> Nat
sumTail = sumAux 0

sym : {A : Set} → {a b : A} → a ≡ b → b ≡ a
sym refl = refl
cong : {A B : Set} → (f : A → B) → {a b : A} → a ≡ b → f a ≡ f b
cong f refl = refl
trans : {A : Set} → {a b c : A} → a ≡ b → b ≡ c → a ≡ c
trans refl refl = refl

comm : ∀ n m → n + m ≡ m + n
comm Z Z = refl
comm Z (S m) rewrite sym (comm Z m)  = refl
comm (S n) Z rewrite comm n Z = refl
comm (S n) (S m) rewrite comm n (S m)
                       | sym (comm (S n) m)
                       | comm n m = refl

sumEq : (f : Nat -> Nat) -> (n : Nat) -> sumTail f n ≡ sumSimple f n
sumEq f Z = refl
sumEq f (S n) rewrite sym (sumEq f n) | comm (f (S n)) 0 = lemma (f (S n)) f n
  where
  lemma : ∀ n f a → sumAux n f a ≡ n + sumAux 0 f a
  lemma Z f a = refl
  -- sumAux (S n) f a ≡ S (n + sumAux 0 f a)
  lemma (S n) f Z rewrite comm n 0 = refl
  lemma (S n) f (S a) rewrite comm 0 (f (S a)) | comm (f (S a)) 0
    = trans (lemma′ n) (cong S (lemma n f (S a)))
    where
    lemma′ : ∀ n → sumAux (f (S a) + S n) f a ≡ S (sumAux (f (S a) + n) f a)
    lemma′ Z = {!!}
    lemma′ (S n) rewrite lemma′ n = {!refl!}
