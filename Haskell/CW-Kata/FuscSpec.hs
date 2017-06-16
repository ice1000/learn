module FuscSpec where
import Fusc
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Simple test" $ do
    it "Should work for 0 ~ 21" $ do
      fusc <$> [0..21] `shouldBe` [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3, 4, 1, 5, 4, 7, 3, 8]
    it "Should work for 150 ~ 200" $ do
      fusc <$> [150..200] `shouldBe` [18,25,7,24,17,27,10,23,13,16,3,17,14,25,11,30,19,27,8,29,21,34,13,31,18,23,5,22,17,29,12,31,19,26,7,23,16,25,9,20,11,13,2,13,11,20,9,25,16,23,7]
--
