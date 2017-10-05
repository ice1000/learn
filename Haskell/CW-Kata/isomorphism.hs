module ISO where

-- so, when are two type, `a` and `b`, considered equal?
-- a definition might be, it is possible to go from `a` to `b`,
-- and from `b` to `a`.
-- Going a roundway trip should leave you the same value.
-- Unfortunately it is virtually impossible to test this in Haskell.
-- This is called Isomorphism.

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
