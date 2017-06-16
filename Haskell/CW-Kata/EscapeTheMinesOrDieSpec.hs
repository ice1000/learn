module EscapeTheMinesOrDie.Test where

import EscapeTheMinesOrDie (Move(..), solve)
import Test.Hspec
import Data.Maybe

main :: IO ()
main = hspec $ do
  describe "A trivial map (1x1)" $ do
    it "Should return an empty list, since we're already at the goal" $ do
      solve [[True]] (0, 0) (0, 0) `shouldBe` (Just [])
    it "Should return Nothing, since we're already die" $ do
      solve [[False]] (0, 0) (0, 0) `shouldBe` Nothing

  describe "A pretty simple map (2x2)" $ do
    let map = unmap [" #"
                    ,"  "]
    it "Should return the only correct move" $ do
      solve map (0, 0) (1, 0) `shouldBe` (Just [R])

    it "Should return Nothing" $ do
      solve map (0, 0) (0, 1) `shouldBe` Nothing

    it "Should return the only moves necessary" $ do
      solve map (0, 0) (1, 1) `shouldBe` (Just [R, D])

  describe "Should walk around an obstacle (3x3 map)" $ do
    let map = unmap ["   "
                    ,"## "
                    ,"   "]

    it "Should return the right sequence of moves" $ do
      solve map (0, 0) (2, 0) `shouldBe` (Just [D, D, R, R, U, U])

    it "Should return Nothing" $ do
      solve map (0, 0) (1, 0) `shouldBe` Nothing

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
      solve map (0, 0) (2, 1) `shouldBe` Nothing

  describe "Should avoid dead-ends (5x5 map)" $ do
    let map = unmap ["   ##"
                    ,"## # "
                    ,"     "
                    ," # ##"
                    ,"#    "]

    it "Should return the right moves" $ do
      solve map (0, 0) (4, 4) `shouldBe` (Just [D, D, R, R, R, R, D, D])
    it "Should return Nothing" $ do
      solve map (0, 0) (4, 0) `shouldBe` Nothing
      solve map (0, 0) (0, 4) `shouldBe` Nothing
      solve map (0, 0) (1, 1) `shouldBe` Nothing

  describe "Should pass stronger tests (7x7 map)" $ do
    let map = unmap ["   ## #"
                    ,"## #  #"
                    ,"     ##"
                    ," # ## #"
                    ," # #  #"
                    ,"#    # "]

    it "Should return the right moves" $ do
      solve map (0, 0) (0, 5) `shouldBe`
        (Just [D, D, R, R, D, D, L, D, L])
    it "Should return Nothing" $ do
      solve map (0, 0) (6, 6) `shouldBe` Nothing
      solve map (0, 0) (6, 0) `shouldBe` Nothing
      solve map (0, 0) (0, 6) `shouldBe` Nothing

  describe "Should work with complex path (7x7 map)" $ do
    let map = unmap ["   ##  "
                    ,"## #  #"
                    ,"   # ##"
                    ," # #  #"
                    ," # #  #"
                    ,"#    # "]

    it "Should return the right moves" $ do
      solve map (0, 0) (0, 6) `shouldBe`
        (Just [D, D, R, R, R, R, R, D, D, L, D, L, U, L, L, D, L, D])

  describe "Should work with complex path (12x12 map)" $ do
    let map = unmap ["   ##   #   "
                    ,"## #  #   # "
                    ,"   # #####  "
                    ," ###  #     "
                    ,"   ## # ####"
                    ,"## #  #     "
                    ,"   # #### ##"
                    ," ###  #     "
                    ,"   ## #### #"
                    ," # #  #  #  "
                    ," # #  #    #"
                    ,"#    #  #   "]
    it "Should work" $ do
      solve map (0, 0) (11, 11) `shouldBe`
        Just [D,D,R,R,U,U,R,R,D,D,R,R,U,U,R,R,D,D,R,R,R,D,D,L,D,L,L,L,U,L,L,D,L,L,U,L,L,D,L,D,D,R,D,D,L,D,D,R,R,R,U,U,U,U,R,R,D,D,R,R,D,R,R,R,R,D]
      solve map (0, 0) (10, 10) `shouldBe`
        Just [D,D,R,R,U,U,R,R,D,D,R,R,U,U,R,R,D,D,R,R,R,D,D,L,D,L,L,L,U,L,L,D,L,L,U,L,L,D,L,D,D,R,D,D,L,D,D,R,R,R,U,U,U,U,R,R,D,D,R,R,D,R,R,R]

unmap :: [[Char]] -> [[Bool]]
unmap = (map (== ' ') <$>)


