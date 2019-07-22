{-# LANGUAGE Strict #-}
module Main where

import           Control.Monad
import qualified Data.Vector.Unboxed.Mutable as V
import           GHC.Prim                    (RealWorld)

type UnionFind = V.MVector RealWorld Int

ask :: UnionFind -> Int -> IO Int
ask vec i = do
  papa <- V.read vec i
  if papa == i then pure i
  else do
    mama <- ask vec papa
    V.write vec i mama
    pure mama

cat :: UnionFind -> Int -> Int -> IO ()
cat vec x y = do
  x' <- ask vec x
  y' <- ask vec y
  V.write vec x' y'

resolve :: Int -> UnionFind -> IO ()
resolve 0 _ = pure ()
resolve n uf = do
  [z, x, y] <- map read . words <$> getLine :: IO [Int]
  if z == 1 then cat uf x y else do
    x' <- ask uf x
    y' <- ask uf y
    putStrLn $ if x' == y' then "Y" else "N"
  resolve (n - 1) uf

main :: IO ()
main = do
  [n, m] <- map read . words <$> getLine
  vector <- V.replicate (n + 1) (0 :: Int)
  forM_ [0 .. n] $ \i -> V.write vector i i
  resolve m vector
