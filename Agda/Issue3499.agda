{-# OPTIONS --no-copatterns #-}
module Issue3499 where

postulate
  A : Set

f : A → A
g : A → A

f y = {!!}
g x = {!!}
