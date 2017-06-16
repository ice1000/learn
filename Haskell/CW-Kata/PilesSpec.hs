module PilesSpec where

import Piles
import Test.Hspec
import System.Random

fourPiles' :: Int -> Int -> [Int]
fourPiles' n y' = let x = floor (fromIntegral n / (y + 2 + 1 / y)) in
  if 0 /= mod x y' || x == y' || x < y'
  then []
  else [x + y', x - y', x * y', div x y']
  where y = (fromIntegral y' :: Float)
--

randomList :: Int -> Int -> IO [Int]
randomList a b = getStdGen >>= return . randomRs (a, b)

getRand :: Int -> Int -> IO [Int]
getRand n a = take n <$> randomList 233 a

test :: (Int, Int) -> Expectation
test (n, y) = fourPiles n y `shouldBe` fourPiles' n y

testR :: [(Int, Int)] -> [Expectation]
testR ls = test <$> [ a | a <- ls, fst a > 0, snd a > 0 ]

-- main :: IO ()
main = hspec $ do
  describe "Sample tests" $ do
    it "Should work" $ do
      fourPiles 48 3 `shouldBe` [12, 6, 27, 3]
      fourPiles 100  4 `shouldBe` [20, 12, 64, 4]
    it "Should return []" $ do
      fourPiles 25 4 `shouldBe` []
      fourPiles 24 4 `shouldBe` []
    it "Should work for random tests" $ do
      l <- getRand 800 233
      r <- getRand 800 666
      head $ testR $ zip l r
--

