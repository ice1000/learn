{-# LANGUAGE NoImplicitPrelude #-}
module Monads where

import Prelude hiding (Monad, Identity, Maybe(..), State, Reader, Writer)
import Data.Monoid

class Monad m where
  return :: a -> m a
  (>>=) :: m a -> (a -> m b) -> m b

data Identity a = Identity a
  deriving (Show, Eq)

data Maybe a = Nothing | Just a
  deriving (Show, Eq)

data State s a = State {runState :: s -> (a, s)}

data Reader s a = Reader {runReader :: s -> a }

data Writer w a = Writer {runWriter :: (w, a)}

instance Monad Identity where
  return = Identity
  (Identity v) >>= f = f v
--

instance Monad Maybe where
  return = Just
  Nothing >>= f = Nothing
  (Just v) >>= f = f v
--

instance Monad (State s) where
  return a = State $ \s -> (a, s)
  (State g) >>= f = State $ \s -> let (a, s1) = g s in runState (f a) s1
--

instance Monad (Reader s) where
  return a = Reader $ \_ -> a
  (Reader g) >>= f = Reader $ \x -> runReader (f $ g x) x
--

instance Monoid w => Monad (Writer w) where
  return a = Writer (mempty, a)
  (Writer (s, v)) >>= f = let (Writer (s1, v1)) = f v in Writer (s `mappend` s1, v1)
--
