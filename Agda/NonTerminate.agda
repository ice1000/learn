module NonTerminate where

open import lib.Basics
open import lib.types.Nat
open import lib.types.Bool

record Conat : Type0 where
  coinductive
  constructor nat
  field
    succ : Unit ⊔ Conat
open Conat

fromNat : Nat -> Conat
fromNat O = nat (inl unit)
fromNat (S n) = nat (inr (fromNat n))

-- {-# NON_TERMINATING #-}
-- mugen-bad : Conat
-- mugen-bad = nat (succ mugen-bad)

mugen : Conat
succ mugen = inr mugen

-- _/2 : Conat -> Conat
-- nat (inl unit) /2 = nat (inl unit)
-- nat (inr (nat (inl unit))) /2 = nat (inl unit)
-- nat (inr (nat (inr x))) /2 = nat (inr (x /2))

-- toNat' : Conat -> Nat
-- toNat' (nat (inl unit)) = O
-- toNat' (nat (inr x)) = S (toNat' x)

-- fromNat' : Nat -> Conat
-- fromNat' O = nat (inl unit)
-- fromNat' (S n) = nat (inr (fromNat' n))

-- proofNat' : forall n -> toNat' (fromNat' n) == n
-- proofNat' O = idp
-- proofNat' (S n) = ap S (proofNat' n)

-- proofNat'' : forall n -> fromNat' (toNat' n) == n
-- proofNat'' (nat (inl unit)) = idp
-- proofNat'' (nat (inr x)) = ap {lzero} {lzero} {Conat} {Conat} (nat ∘ inr) (proofNat'' x)

-- conat-is-nat : Conat == Nat
-- conat-is-nat = ua (equiv toNat' fromNat' proofNat' proofNat'' )

{-# TERMINATING #-}
_co<_ : Conat -> Conat -> Bool
a' co< b' with succ a' | succ b'
... | inl unit | inl unit = false
... | inl unit | inr _ = true
... | inr _ | inl unit = false
... | inr a | inr b = a co< b

_ = idp :> ((fromNat 1 co< fromNat 2) == true)
_ = idp :> ((fromNat 2 co< fromNat 2) == false)
_ = idp :> ((fromNat 3 co< fromNat 2) == false)

open import Agda.Builtin.Size

record Colist {i} (s : Size) (A : Type i) : Type i where
  coinductive
  constructor _:>:_
  field
    cohead : A
    cotail : {ss : Size< s} -> Colist ss A
open Colist

variable
  i : ULevel
  s : Size

ones : Colist s Nat
cohead ones = 1
cotail ones = ones

open import lib.types.List

cotake : {A : Type i} -> Nat -> Colist ∞ A -> List A
cotake O as = nil
cotake (S n) as = cohead as :: cotake n (cotail as)

cozipWith : {A B C : Type i} -> (A -> B -> C)
          -> Colist s A -> Colist s B -> Colist s C
cohead (cozipWith f a b) = f (cohead a) (cohead b)
cotail (cozipWith f a b) = cozipWith f (cotail a) (cotail b)

cofib : Colist s Nat
cohead cofib = 0
cohead (cotail cofib) = 1
cotail (cotail cofib) = cozipWith _+_ cofib (cotail cofib)

_ = idp :> (cotake 1 ones == 1 :: nil)
_ = idp :> (cotake 2 ones == 1 :: 1 :: nil)
_ = idp :> (cotake 3 ones == 1 :: 1 :: 1 :: nil)
_ = idp :> (cotake 4 ones == 1 :: 1 :: 1 :: 1 :: nil)
_ = idp :> (cotake 5 ones == 1 :: 1 :: 1 :: 1 :: 1 :: nil)
_ = idp :> (cotake 6 ones == 1 :: 1 :: 1 :: 1 :: 1 :: 1 :: nil)
_ = idp :> (cotake 7 ones == 1 :: 1 :: 1 :: 1 :: 1 :: 1 :: 1 :: nil)

a = cotake 15 cofib

_ = idp :> (a == O ::
                   1 ::
                   1 ::
                   2 ::
                   3 ::
                   5 :: 8 :: 13 :: 21 :: 34 :: 55 :: 89 :: 144 :: 233 :: 377 :: nil)


x = cotake 25 cofib

_ = idp :> (x == O :: 1 :: 1 :: 2 :: {!!})

