{-# LANGUAGE TypeOperators, TypeFamilies, GADTs, UndecidableInstances #-}

module TimesComm where

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

-- | Peano definition of multiplication.
type family (:*:) (n :: *) (m :: *) :: *
type instance Z :*: m = Z
type instance S n :*: m = m :+: (n :*: m)

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

plus' :: Equal n m -> Natural a -> Equal (n :+: a) (m :+: a)
plus'  EqlZ b = reflexive b
plus' (EqlS a) b = EqlS $ plus' a b

times :: Natural n -> Natural m -> Natural (n :*: m)
times  NumZ    _ = NumZ
times (NumS a) b = plus b $ times a b

-- | a + (b + c) = (a + b) + c
plusAssoc :: Natural a -> Natural b -> Natural c -> Equal (a :+: (b :+: c)) ((a :+: b) :+: c)
plusAssoc NumZ b c = reflexive $ plus b c
plusAssoc (NumS a) b c = EqlS $ plusAssoc a b c

plusComm :: Natural a -> Natural b -> Equal (a :+: b) (b :+: a)
plusComm NumZ NumZ = EqlZ
plusComm NumZ (NumS b) = EqlS (plusComm NumZ b)
plusComm (NumS a) NumZ = EqlS (plusComm a NumZ)
plusComm sa@(NumS a) sb@(NumS b) = EqlS ((plusComm a sb) <=> (EqlS $ plusComm b a) <=> plusComm sa b)

zeroComm :: Natural a -> Equal Z (a :*: Z)
zeroComm NumZ = EqlZ
zeroComm (NumS a) = zeroComm a

-- This is the proof that the kata requires.
-- | a * b = b * a
timesComm :: Natural a -> Natural b -> Equal (a :*: b) (b :*: a)
timesComm NumZ NumZ = EqlZ
timesComm NumZ (NumS b) = zeroComm b
timesComm (NumS a) NumZ = symmetric $ zeroComm a
timesComm sa@(NumS a) sb@(NumS b) = EqlS $
      plusComm b (times a sb)
  -- Equal ((a :*: sb) :+: b) (a :+: (b :*: sa))
  <=> plus' (timesComm a sb) b
  -- Equal ((a :+: (b :*: a)) :+: b) (a :+: (b :*: sa))
  <=> symmetric (plusAssoc a (times b a) b)
  -- Equal (a :+: ((b :*: a) :+: b)) (a :+: (b :*: sa))
  <=> plusComm a (plus (times b a) b)
  -- Equal (((b :*: a) :+: b) :+: a) (a :+: (b :*: sa))
  <=> symmetric (plusAssoc (times b a) b a)
  -- Equal ((b :*: a) :+: (b :+: a)) (a :+: (b :*: sa))
  <=> plus' (timesComm b a) (plus b a)
  -- Equal ((a :*: b) :+: (b :+: a)) (a :+: (b :*: sa))
  <=> plusAssoc (times a b) b a
  -- Equal (((a :*: b) :+: b) :+: a) (a :+: (b :*: sa))
  <=> plus' (plusComm (times a b) b) a
  -- Equal ((b :+: (a :*: b)) :+: a) (a :+: (b :*: sa))
  -- Definitional Equality
  -- Equal ((sa :*: b) :+: a) (a :+: (b :*: sa))
  <=> plus' (timesComm sa b) a
  -- Equal ((b :*: sa) :+: a) (a :+: (b :*: sa))
  <=> plusComm (times b sa) a
  -- Equal (a :+: (b :+: (a :*: b))) (a :+: (b :*: sa))
  <=> reflexive (plus a (times b sa))
