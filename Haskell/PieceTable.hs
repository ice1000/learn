{-# LANGUAGE GADTs #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}

module PieceTable where

class Editable e item where
  initial       :: e item
  insert        :: Integral pos => e item -> pos -> item -> e item
  insertSome    :: Integral pos => e item -> pos -> [item] -> e item
  delete        :: Integral pos => e item -> pos -> e item
  deleteBetween :: Integral pos => e item -> pos -> pos -> e item
  itemAt        :: Integral pos => e item -> pos -> Maybe item
  adjust        :: e item -> e item

  insert e p = insertSome e p . return
  insertSome e _ [      ] = e
  insertSome e p (x : xs) = insertSome (insert e p x) (succ p) xs
  delete = (<*> succ) . deleteBetween
  deleteBetween e p1 p2 | p1 > p2 = deleteBetween (delete e p1) (succ p1) p2
                        | otherwise = e
  adjust = id

  {-# MINIMAL
      initial
    , itemAt
    , (insert | insertSome)
    , (delete | deleteBetween)
    #-}
--

data PieceTable item where
  Empty  :: PieceTable item
  Append :: Integral pos => PieceTable item -> pos -> [item]
    -> PieceTable item
  Delete :: Integral pos => PieceTable item -> pos -> pos
    -> PieceTable item
--

instance Editable PieceTable item where
  initial = Empty
  insertSome = Append
  deleteBetween = Delete
--

-- OBSOLETE CODES
-- type Item = Char
-- type Position = Int
-- type Editable = [Item]
-- insert :: Editable -> Position -> Item -> Editable
-- empty :: Editable
-- empty = []
-- data Editable where
  -- Empty :: Editable
  -- Insert :: Editable -> Position -> Item -> Editable
-- delete :: Editable -> Position -> Editable
-- delete  Empty _ = Empty
-- delete (Insert s p1 i) p2 | p1 <  p2 = Insert (delete s (p2 - 1)) p1 i
                          -- | p1 == p2 = s
                          -- | p1 >  p2 = Insert (delete s p2) (p1 - 1) i
--
-- itemAt :: Editable -> Position -> Maybe Item
-- itemAt Empty _ = Nothing
-- itemAt (Insert s p1 i) p2 | p1 <  p2 = itemAt s $ p2 - 1
                          -- | p1 == p2 = i
                          -- | p1 >  p2 = itemAt s p2
--
-- itemAt :: Editable -> Position -> Maybe Item
-- itemAt Empty _ = Nothing
-- itemAt (Insert s p1 i) p2 | p1 <  p2 = itemAt s $ p2 - 1
                          -- | p1 == p2 = i
                          -- | p1 >  p2 = itemAt s p2
--

