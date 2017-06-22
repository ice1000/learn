{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes, ExistentialQuantification #-}

module FoldingThroughAFixedPoint where

import Control.Applicative

-- Consider the two following types
newtype Least f
  = Least (forall r . (f r -> r) -> r)
--

data Greatest f
  = forall s . Greatest (s -> f s) s
--

-- They each have a special non-recursive relationship with 'f' when
-- it is a 'Functor'
unwrap :: Functor f => Greatest f -> f (Greatest f)
unwrap (Greatest u s) = Greatest u <$> u s

wrap :: Functor f => f (Least f) -> Least f
wrap f = Least (\k -> k (fold k <$> f))

-- They each are closely tied to the notions of folding and unfolding
-- as well
fold :: (f r -> r) -> (Least f -> r)
fold k (Least g) = g k

unfold :: (s -> f s) -> (s -> Greatest f)
unfold = Greatest

-- It is the case that any "strictly positive"
-- type in Haskell is representable using Least.

-- We first need the data type's "signature functor".
-- For instance, here is one for []
data ListF a x = Nil | Cons a x deriving Functor

-- Then we can map into and out of lists
listLeast :: [a] -> Least (ListF a)
listLeast l = Least $ \k -> k $ case l of
  []     -> Nil
  a : as -> Cons a (fold k (listLeast as))
--

leastList :: Least (ListF a) -> [a]
leastList = fold $ \case
  Nil       -> []
  Cons a as -> a : as
--

-- It is also the case that these types are representable using
-- Greatest.
listGreatest :: [a] -> Greatest (ListF a)
listGreatest = unfold $ \case
  []     -> Nil
  a : as -> Cons a as
--

greatestList :: Greatest (ListF a) -> [a]
greatestList (Greatest u s) = case u s of
  Nil       -> []
  Cons a s' -> a : greatestList (unfold u s')
--

-- Given all of these types are isomorphic, we ought to be able to go
-- directly from least to greatest fixed points and visa versa. Can
-- you write the functions which witness this last isomorphism
-- generally for any functor?
greatestLeast :: Functor f => Greatest f -> Least f
greatestLeast = intermediate2L . g2Intermediate

leastGreatest :: Functor f => Least f -> Greatest f
leastGreatest = intermediate2G . l2Intermediate

newtype Intermediate f = Intermediate {
  unIntermediate :: f (Intermediate f)
  }
--

g2Intermediate :: Functor f => Greatest f -> Intermediate f
g2Intermediate (Greatest f a) = ana f a
  where ana f = Intermediate . (ana f <$>) . f
--

intermediate2L :: Functor f => Intermediate f -> Least f
intermediate2L x = Least $ \f -> cata f x
  where cata f = f . (cata f <$>) . unIntermediate
--

l2Intermediate :: Least f -> Intermediate f
l2Intermediate (Least k) = k Intermediate

intermediate2G :: Intermediate f -> Greatest f
intermediate2G = Greatest unIntermediate

