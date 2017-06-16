module FuscSpec where
import Fusc
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Simple test" $ do
    it "Should work for 0 and 1" $ do
      fusc 1 `shouldBe` 1
      fusc 0 `shouldBe` 0
    it "Should work for 0 ~ 21" $ do
      fusc <$> [0..21] `shouldBe` [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3, 4, 1, 5, 4, 7, 3, 8]
    it "Should work for 85" $ do
      fusc 85 `shouldBe` 21
--
