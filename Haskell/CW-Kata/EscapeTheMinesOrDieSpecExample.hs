module EscapeTheMinesOrDie.Test where

import EscapeTheMinesOrDie (Move(..), solve)
import Test.Hspec
import Data.Maybe

main :: IO ()
main = hspec $ do
  describe "A trivial map (1x1)" $ do
    let map = [[True]]
    it "Should return an empty list, since we're already at the goal" $ do
      solve map (0, 0) (0, 0) `shouldBe` (Just [])
    it "Should return Nothing, since we're already die" $ do
      solve [[False]] (0, 0) (0, 0) `shouldBe` Nothing

  describe "A pretty simple map (2x2)" $ do
    let map = unmap [" #"
                    ,"  "]
    it "Should return the only correct move" $ do
      solve map (0, 0) (1, 0) `shouldBe` (Just [R])

    it "Should return the only moves necessary" $ do
      solve map (0, 0) (1, 1) `shouldBe` (Just [R, D])

  describe "Should walk around an obstacle (3x3 map)" $ do
    let map = unmap ["   "
                    ,"## "
                    ,"   "]

    it "Should return the right sequence of moves" $ do
      solve map (0, 0) (2, 0) `shouldBe` (Just [D, D, R, R, U, U])

  describe "Should be able to change directions multiple times (5x5 map)" $ do
    let map = unmap ["  ###"
                    ,"#  ##"
                    ,"##  #"
                    ,"###  "
                    ,"#### "]

    it "Should return a step sequence of moves" $ do
      solve map (0, 0) (4, 4) `shouldBe` (Just [D, R, D, R, D, R, D, R])
    it "Should return Nothing" $ do
      solve map (0, 0) (3, 1) `shouldBe` Nothing

  describe "Should avoid dead-ends (5x5 map)" $ do
    let map = unmap ["   ##"
                    ,"## # "
                    ,"     "
                    ," # ##"
                    ,"#    "]

    it "Should return the right moves" $ do
      solve map (0, 0) (4, 4) `shouldBe` (Just [D, D, R, R, R, R, D, D])

unmap = map (map (== ' '))

