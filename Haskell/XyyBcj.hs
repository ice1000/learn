{-# LANGUAGE Strict #-}
module Main where

import           Control.Monad
import qualified Data.Vector.Unboxed.Mutable as V
import           GHC.Prim                    (RealWorld)

type UnionFind = V.MVector RealWorld Int

ask :: UnionFind -> Int -> IO (UnionFind, Int)
ask vec i = do
  papa <- V.read vec i
  if papa == i then pure (vec, i)
  else do
    (vec', mama) <- ask vec papa
    V.write vec' i mama
    pure (vec', mama)

cat :: UnionFind -> Int -> Int -> IO UnionFind
cat vec x y = do
  (vec' , x') <- ask vec  x
  (vec'', y') <- ask vec' y
  V.write vec'' x' y'
  pure vec''

resolve :: Int -> UnionFind -> IO ()
resolve 0 _ = pure ()
resolve n uf = do
  [z, x, y] <- map read . words <$> getLine :: IO [Int]
  uf' <- if z == 1 then cat uf x y else do
    (vec , x') <- ask uf  x
    (vec', y') <- ask vec y
    putStrLn $ if x' == y' then "Y" else "N"
    pure vec'
  resolve (n - 1) uf'

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  vector <- V.replicate (n + 1) (0 :: Int)
  forM_ [0 .. n] $ \i -> V.write vector i i
  resolve m vector
