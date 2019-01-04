{-# LANGUAGE TypeOperators, TypeFamilies, GADTs #-}

module PlusAssoc where

-- | The natural numbers, encoded in types.
data Z
data S n

-- | Predicate describing natural numbers.
-- | This allows us to reason with `Nat`s.
data Natural :: * -> * where
  NumZ :: Natural Z
  NumS :: Natural n -> Natural (S n)

-- | Predicate describing equality of natural numbers.
data Equal :: * -> * -> * where
  EqlZ :: Equal Z Z
  EqlS :: Equal n m -> Equal (S n) (S m)

-- | Peano definition of addition.
type family (:+:) (n :: *) (m :: *) :: *
type instance Z :+: m = m
type instance S n :+: m = S (n :+: m)

-- | For any n, n = n.
reflexive :: Natural n -> Equal n n
reflexive NumZ = EqlZ
reflexive (NumS n) = EqlS (reflexive n)

-- | if a = b, then b = a.
symmetric :: Equal a b -> Equal b a
symmetric EqlZ = EqlZ
symmetric (EqlS eq) = EqlS (symmetric eq)

-- | if a = b and b = c, then a = c.
(<=>) :: Equal a b -> Equal b c -> Equal a c
EqlZ <=> EqlZ = EqlZ
(EqlS ab) <=> (EqlS bc) = EqlS (ab <=> bc)

plus :: Natural n -> Natural m -> Natural (n :+: m)
plus  NumZ    b = b
plus (NumS a) b = NumS $ plus a b

-- This is the proof that the kata requires.
-- | a + (b + c) = (a + b) + c
plusAssoc :: Natural a -> Natural b -> Natural c -> Equal (a :+: (b :+: c)) ((a :+: b) :+: c)
plusAssoc NumZ b c = reflexive $ plus b c
plusAssoc sa@(NumS a) b c = EqlS $ plusAssoc a b c
