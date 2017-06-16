module GuessTheArraySpec where

import GuessTheArray
import Test.Hspec
import System.Random

functionForGuess :: Integral n => [n] -> Int -> Int -> n
functionForGuess ls a b = if elem (abs $ a - b) [1, 2]
  then ls !! a + ls !! b
  else error "abs (a - b) is 0 or larger than 2"
--                

testFun :: Integral n => [n] -> [n]
testFun arr = guess (functionForGuess arr) $ length arr

test arr = testFun arr `shouldBe` arr
testR n = getRand n >>= test

randomList :: Int -> Int -> IO [Int]
randomList a b = getStdGen >>= return . randomRs (a, b)

getRand :: Int -> IO [Int]
getRand n = take n <$> randomList 233 666

main :: IO ()
main = hspec $ do
  describe "Simple tests" $ do
    it "Should work for simple array" $ do
      test [1, 2, 3, 4, 5, 6, 7]
      test [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    it "Should work for arrays with just 3 elements" $ do
      test [2, 3, 3]
      test [6, 6, 6]
  describe "Random tests" $ do
    it "Should work for long (96 ~ 100) arrays" $ do
      testR 96
      testR 98
      testR 100
    it "Should work for very long (996 ~ 1000) arrays" $ do
      testR 996
      testR 998 -- 只要 998 ！ 只要 998 ！
      testR 1000
    it "Should work for super arrays (5000 ~ 5005) arrays" $ do
      testR 5000
      testR 5005
--


