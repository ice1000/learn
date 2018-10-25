## TestLiterate

Let's have some agda codes:

```agda
{-# OPTIONS --without-K #-}
module TestLiterate where

open import lib.Basics
open import lib.types.Bool
```

And create a `not` for `Bool` in HoTT-Agda:

```agda
-- not for Bool
not : Bool -> Bool
not true = false
not false = true
```
