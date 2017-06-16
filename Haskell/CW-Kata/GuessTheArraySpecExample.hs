module GuessTheArraySpec where

import GuessTheArray
import Test.Hspec

functionForGuess :: Integral n => [n] -> Int -> Int -> n
functionForGuess ls a b = if elem (abs $ a - b) [1, 2]
  then ls !! a + ls !! b
  else error "abs (a - b) is 0 or larger than 2"
--
                
testFun :: Integral n => [n] -> [n]
testFun arr = guess (functionForGuess arr) $ length arr

test arr = testFun arr `shouldBe` arr

main :: IO ()
main = hspec $ do
  describe "Simple tests" $ do
    it "Should work for simple array" $ do
      test [1, 2, 3, 4, 5, 6, 7]
      test [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    it "Should work for arrays with just 3 elements" $ do
      test [2, 3, 3]
      test [6, 6, 6]
--


