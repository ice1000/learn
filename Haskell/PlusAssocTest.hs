{-# LANGUAGE GADTs           #-}
{-# LANGUAGE TypeFamilies    #-}
{-# LANGUAGE TypeOperators   #-}
{-# LANGUAGE TemplateHaskell #-}

module Kata.AdditionAssoc.TestSpec (main) where

import Kata.AdditionAssoc
import Kata.AdditionAssoc.Definitions

import Test.Hspec

-- | Verify that the functions' signature is correct:
solution :: Natural a -> Natural b -> Natural c -> Equal (a :+: (b :+: c)) ((a :+: b) :+: c)
solution = plusAssoc

_0 = NumZ
_1 = NumS _0
_2 = NumS _1
_3 = NumS _2
_4 = NumS _3
_5 = NumS _4
_6 = NumS _5
_7 = NumS _6

__0 = EqlZ
__1 = EqlS __0
__2 = EqlS __1
__3 = EqlS __2
__4 = EqlS __3
__5 = EqlS __4
__6 = EqlS __5
__7 = EqlS __6

main :: IO ()
main = hspec $ do
  describe "Proof checking" $ do
    it "Doesn't use any unsafe modules" $
      hidden [Module "Unsafe.Coerce"]
    it "Simple tests" $ do
      solution _0 _0 _0 `shouldBe` __0
      solution _1 _0 _1 `shouldBe` __2
      solution _5 _2 _0 `shouldBe` __7
      solution _2 _3 _2 `shouldBe` __7
    it "Methodical tests" $ $(makeTests [| solution |])
