{-# LANGUAGE RankNTypes #-}

module Kata where

import Prelude hiding (undefined, error)
import Data.Void

from
  :: (forall a. ((a -> Void) -> Void) -> a)
  -> (forall a. forall b. (a -> b) -> ((a -> Void) -> b) -> b)
from dne = \ab avb -> dne $ \bv -> bv (avb $ bv . ab)

to
  :: (forall a. forall b. (a -> b) -> ((a -> Void) -> b) -> b)
  -> (forall a. ((a -> Void) -> Void) -> a)
to pem = \avv -> pem id $ absurd . avv
