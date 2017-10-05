module CanYouGetTheLoop where
import CanYouGetTheLoop.Types
-- import Data.List

{-
data Node a
instance Eq a => Eq (Node a)

next :: Node a -> Node a
next = id
-}

calculate :: Eq a => [Node a] -> Node a -> Int
calculate visited this = case elemIndex this visited of
  (Just i) -> i + 1
  _ -> calculate (this : visited) $ next this
--
    
loopSize :: Eq a => Node a -> Int
loopSize = calculate []

