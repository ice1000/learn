module Tree2 where

data Tree e = Leaf e
          | Node e (Tree e) (Tree e)
          | SNode e (Tree e)
           deriving (Show)
--

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree fn (Leaf x)     = Leaf $ fn x
mapTree fn (SNode x m)  = SNode (fn x) (mapTree fn m)
mapTree fn (Node x l r) = Node (fn x) (mapTree fn l) (mapTree fn r)

-- let a = (Node 1 (Node 2 (Leaf 3) (Leaf 4)) (Leaf 5))
-- mapTree (\x -> x + 233) a
-- mapTree (+ 233) a
-- mapTree (* 2) a

main = putStrLn ""
