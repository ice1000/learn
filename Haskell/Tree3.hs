module TreeFunctor where

data Tree e = Leaf e
          | Node e (Tree e) (Tree e)
          | SNode e (Tree e)
           deriving (Show)
--

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree fn (Leaf x)     = Leaf $ fn x
mapTree fn (SNode x m)  = SNode (fn x) (mapTree fn m)
mapTree fn (Node x l r) = Node (fn x) (mapTree fn l) (mapTree fn r)

class MyFunctor f where
  fmap :: (a -> b) -> f a -> f b
--

instance MyFunctor Tree where
  fmap = mapTree
--
