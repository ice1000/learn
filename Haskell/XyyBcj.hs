module XyyBcj where

import Control.Monad
import Control.Monad.State
import Data.Vector ((!), (//), Vector)

-- import Data.List.Split

type UFind  = Vector Int
type UFindM = State UFind

ask :: Int -> UFindM Int
ask i = do
  parent <- (! i) <$> get
  when (parent /= i) $ do
    root <- ask parent
    modify (// pure (i, root))
  (! i) <$> get

cat :: Int -> Int -> UFindM ()
cat x y = do
  xRoot <- ask x
  yRoot <- ask y
  modify (// pure (xRoot, yRoot))
