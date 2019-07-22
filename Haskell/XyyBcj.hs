{-# LANGUAGE Strict #-}
{-# GHC-OPTIONS -O2 #-}
module Main where

import           Control.Monad
import           Data.Char
import qualified Data.Text                   as T
import qualified Data.Text.IO                as I
import qualified Data.Vector.Unboxed.Mutable as V
import           GHC.Prim                    (RealWorld)

type UnionFind = V.MVector RealWorld Int

int :: String -> Int
int s = int' s 0
  where
    int' [    ] n = n
    int' (c:cs) n = int' cs $ n * 10 + (ord c - ord '0')

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
  [z, x, y] <- map (int . T.unpack) . T.words <$> I.getLine
  if z == 1 then cat uf x y else do
    x' <- ask uf x
    y' <- ask uf y
    putChar $ if x' == y' then 'Y' else 'N'
    putChar '\n'
  resolve (n - 1) uf

main :: IO ()
main = do
  [n, m] <- map (int . T.unpack) . T.words <$> I.getLine
  vector <- V.replicate (n + 1) (0 :: Int)
  forM_ [0 .. n] $ \i -> V.write vector i i
  resolve m vector
