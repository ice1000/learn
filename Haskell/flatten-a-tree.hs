module Flatten where

data Node a = Child a | Parent (Node a) a (Node a) deriving (Show, Eq)
data Tree a = Empty | Root (Node a) deriving (Show, Eq)

invert :: Tree a -> Tree a
invert Empty = Empty
invert (Root n) = Root (aux n)
  where
    aux (Child a) = Child a
    aux (Parent l n r) = Parent (aux r) n (aux l)
--

size :: Tree a -> Int
size Empty    = 0
size (Root n) = aux n
  where
    aux (Child _) = 1
    aux (Parent l _ r) = aux l + 1 + aux r
--

flatten :: Tree a -> [a]
flatten Empty    = []
flatten (Root n) = aux n
  where
    aux (Child a) = [a]
    aux (Parent l n r) = aux l ++ [n] ++ aux r
--

