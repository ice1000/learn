module ISO where

import Data.Maybe
import Data.Void
-- a type of `Void` have no value.
-- So it is impossible to construct `Void`,
-- unless using undefined, error, unsafeCoerce, infinite recursion, etc
-- And there is a function
-- absurd :: Void -> a
-- That get any value out of `Void`
-- We can do this becuase we can never have void in the zeroth place.

-- Please copy your code of Isomorphism to here.

-- Sometimes, we can treat a Type as a Number:
-- if a Type t has n distinct value, it's Number is n.
-- This is formally called cardinality.
-- See https://en.wikipedia.org/wiki/Cardinality

-- Void has cardinality of 0 (we will abreviate it Void is 0).
-- () is 1.
-- Bool is 2.
-- Maybe a is 1 + a.
-- We will be using peano arithmetic so we will write it as S a.
-- https://en.wikipedia.org/wiki/Peano_axioms
-- Either a b is a + b.
-- (a, b) is a * b.
-- a -> b is b ^ a. Try counting (() -> Bool) and (Bool -> ())

-- Algebraic data type got the name because
-- it satisfies a lot of algebraic rules under isomorphism

type ISO a b = (a -> b, b -> a)

-- given ISO a b, we can go from a to b
substL :: ISO a b -> (a -> b)
substL = fst

-- and vice versa
substR :: ISO a b -> (b -> a)
substR = snd

-- There can be more than one ISO a b
isoBool :: ISO Bool Bool
isoBool = (id, id)

isoBoolNot :: ISO Bool Bool
isoBoolNot = (not, not)

-- isomorphism is reflexive
refl :: ISO a a
refl = (id, id)

-- isomorphism is symmetric
symm :: ISO a b -> ISO b a
symm (a, b) = (b, a)

-- isomorphism is transitive
trans :: ISO a b -> ISO b c -> ISO a c
trans (ab, ba) (bc, cb) = (bc . ab, ba . cb)

-- We can combine isomorphism:
isoTuple :: ISO a b -> ISO c d -> ISO (a, c) (b, d)
isoTuple (ab, ba) (cd, dc) = (\(a, c) -> (ab a, cd c), \(b, d) -> (ba b, dc d))
--
isoList :: ISO a b -> ISO [a] [b]
isoList (a, b) = ((a <$>), (b <$>))

isoMaybe :: ISO a b -> ISO (Maybe a) (Maybe b)
isoMaybe (a, b) = ((a <$>), (b <$>))

isoEither :: ISO a b -> ISO c d -> ISO (Either a c) (Either b d)
isoEither (ab, ba) (cd, dc) = (fun ab cd, fun ba dc)
  where fun f g o = case o of
          (Left obj) -> Left $ f obj
          (Right obj) -> Right $ g obj
--

isoFunc :: ISO a b -> ISO c d -> ISO (a -> c) (b -> d)
isoFunc (ab, ba) (cd, dc) = ((\ac -> cd . ac . ba), (\bd -> dc . bd . ab))

-- Going another way is hard (and is generally impossible)
isoUnMaybe :: ISO (Maybe a) (Maybe b) -> ISO a b
isoUnMaybe m@(mamb, mbma) =
    (\a -> get $ mamb $ Just a, substL $ isoUnMaybe $ symm m)
      where
        get (Just b) = b
        get Nothing = getJust (mamb Nothing)
        getJust (Just b) = b
        getJust Nothing = undefined
-- The implementation is given fully.
-- But why can we use undefined in our implmentation?
-- Because it is impossible for getJust Nothing to be invoke.
-- We wont test for isoUnMaybe,
-- but try to state why it is impossible in the comment here.

-- We cannot have
-- isoUnEither :: ISO (Either a b) (Either c d) -> ISO a c -> ISO b d.
-- Try to state why in the comment here.
-- Suppose we have isoUnEither,
-- ...,
-- Impossible,
-- We cannot have isoUnEither
-- Again, this wont be tested.

-- And we have isomorphism on isomorphism!
isoSymm :: ISO (ISO a b) (ISO b a)
isoSymm = (symm, symm)                                                                                             
-- a = b -> c = d -> a * c = b * d
isoProd :: ISO a b -> ISO c d -> ISO (a, c) (b, d)
isoProd = isoTuple

-- a = b -> c = d -> a + c = b + d
isoPlus :: ISO a b -> ISO c d -> ISO (Either a c) (Either b d)
isoPlus = isoEither

-- a = b -> S a = S b
isoS :: ISO a b -> ISO (Maybe a) (Maybe b)
isoS = isoMaybe

-- a = b -> c = d -> c ^ a = d ^ b
isoPow :: ISO a b -> ISO c d -> ISO (a -> c) (b -> d)
isoPow = isoFunc

mirror :: (Either a b) -> (Either b a)
mirror (Left l) = Right l
mirror (Right r) = Left r

-- a + b = b + a
plusComm :: ISO (Either a b) (Either b a)
plusComm = (mirror, mirror)

mirror2L :: (Either (Either a b) c) -> (Either a (Either b c))
mirror2L (Left (Left a))  = Left a
mirror2L (Left (Right a)) = Right $ Left a
mirror2L (Right a)        = Right $ Right a

mirror2R :: (Either a (Either b c)) -> (Either (Either a b) c)
mirror2R (Right (Right a))  = Right a
mirror2R (Right (Left a)) = Left $ Right a
mirror2R (Left a)        = Left $ Left a

-- a + b + c = a + (b + c)
plusAssoc :: ISO (Either (Either a b) c) (Either a (Either b c))
plusAssoc = (mirror2L, mirror2R)

-- a * b = b * a
multComm :: ISO (a, b) (b, a)
multComm = (f, f)
  where f (x, y) = (y, x)
--

-- a * b * c = a * (b * c)
multAssoc :: ISO ((a, b), c) (a, (b, c))
multAssoc = (\((a, b), c) -> (a, (b, c)), \(a, (b, c)) -> ((a, b), c))

distL :: (a, (Either b c)) -> (Either (a, b) (a, c))
distL (a, Left b)  = Left (a, b)
distL (a, Right c) = Right (a, c)

distR :: (Either (a, b) (a, c)) -> (a, (Either b c))
distR (Left (a, b))  = (a, Left b)
distR (Right (a, c)) = (a, Right c)

-- dist :: a * (b + c) = a * b + a * c
dist :: ISO (a, (Either b c)) (Either (a, b) (a, c))
dist = (distL, distR)

-- (c ^ b) ^ a = c ^ (a * b)
curryISO :: ISO (a -> b -> c) ((a, b) -> c)
curryISO = (\f -> (\(a, b) -> f a b), \f -> (\a b -> f (a, b)))

-- 1 = S O (we are using peano arithmetic)
-- https://en.wikipedia.org/wiki/Peano_axioms
one :: ISO () (Maybe Void)
one = (const Nothing, const ())

twoL :: Bool -> (Maybe (Maybe Void))
twoL True  = Just Nothing
twoL False = Nothing

-- 2 = S (S O)
two :: ISO Bool (Maybe (Maybe Void))
two = (twoL, isJust)

-- O + b = b
plusO :: ISO (Either Void b) b
plusO = (left, Right)
  where
    left (Left  x) = absurd x -- absurd :: Void -> a
    left (Right x) = x
--

plusSL :: (Either (Maybe a) b) -> (Maybe (Either a b))
plusSL (Left (Just a)) = Just $ Left a
plusSL (Right b)       = Just $ Right b
plusSL _               = Nothing

plusSR :: (Maybe (Either a b)) -> (Either (Maybe a) b)
plusSR (Just (Left a))  = Left $ Just a
plusSR (Just (Right b)) = Right b
plusSR _                = Left Nothing

-- S a + b = S (a + b)
plusS :: ISO (Either (Maybe a) b) (Maybe (Either a b))
plusS = (plusSL, plusSR)

-- 1 + b = S b
plusSO :: ISO (Either () b) (Maybe b)
plusSO = isoPlus one refl `trans` plusS `trans` isoS plusO

-- O * a = O
multO :: ISO (Void, a) Void
multO = (fst, absurd)

multSL :: (Maybe a, b) -> (Either b (a, b))
multSL ((Just a), b) = Right (a, b)
multSL (_       , b) = Left b

multSR :: (Either b (a, b)) -> (Maybe a, b)
multSR (Left b)       = (Nothing, b)
multSR (Right (a, b)) = (Just a, b)

-- S a * b = b + a * b
multS :: ISO (Maybe a, b) (Either b (a, b))
multS = (multSL, multSR)

-- 1 * b = b
multSO :: ISO ((), b) b
multSO =
  isoProd one refl `trans`
  multS `trans`
  isoPlus refl multO `trans`
  plusComm `trans`
  plusO
--

-- a ^ O = 1
powO :: ISO (Void -> a) ()
powO = (undefined, \_ -> absurd)

-- a ^ (S b) = a * (a ^ b)
powS :: ISO (Maybe b -> a) (a, b -> a)
powS = (\f -> (f Nothing, f . Just),
        \(a, f) -> (\b -> fromMaybe a $ f <$> b))
--

-- a ^ 1 = a
-- Go the hard way to prove that you really get what is going on!
powSO :: ISO (() -> a) a
powSO = (\f -> f (), const)

--_ `trans` powS `trans` _
-- Here's a trick:
-- replace undefined with the rhs of the comment on previous line
-- When you're not sure what to fill in for a value,
-- Have it as a _
-- GHC will goes like
-- "Found hole `_' with type: (Num (ISO (() -> a) (Maybe b0 -> a0)))"
-- So you can immediately see value of what type are needed
-- This process can be repeat indefinitely -
-- For example you might replace `_` with `isoFunc _ _`
-- So GHC hint you on more specific type.
-- This is especially usefull if you have complex type.
-- See https://wiki.haskell.org/GHC/Typed_holes
-- And "stepwise refinement" for more details.

