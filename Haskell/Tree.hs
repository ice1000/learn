module Tree where

data Tree e = Leaf e
          | Node e (Tree e) (Tree e)
          | SNode e (Tree e)
           deriving (Show)
--

-- Node 666 (Leaf 233) (Leaf 555)

-- Leaf 233

-- (Node 1 (Node 2 (Leaf 3) (Leaf 4)) (Leaf 5))

-- Node 1 (SNode 2 (Leaf 4)) (Leaf 5)

treeSum :: (Num e) => Tree e -> e
treeSum (Leaf e) = e
treeSum (SNode e sub) = e + (treeSum sub)
treeSum (Node e left right) = e + (treeSum left) + (treeSum right)

-- treeSum (Node 1 (Node 2 (Leaf 3) (Leaf 4)) (Leaf 5))

