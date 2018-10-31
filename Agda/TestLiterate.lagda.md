# Fuck you

## TestLiterate

Let's have some agda codes:

+ A
+ B
+ C

```agda
{-# OPTIONS --without-K #-}
module TestLiterate where

open import lib.Basics
open import lib.types.Bool
```

And create a `not` for `Bool` in HoTT-Agda:

0. A
0. B
0. C

**Wori**

> This is a ref

```agda
-- not for Bool
not : Bool -> Bool
not true = false
not false = true

not-lemma : ∀ n -> not (not n) == n
not-lemma true  = idp
not-lemma false = idp

not-ua : Bool ≃ Bool
not-ua = equiv not not not-lemma not-lemma
```
