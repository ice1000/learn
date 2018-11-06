## MdPreserveLit

### List items

0. Agda!
0. Hello!
0. World!

### Enums

+ Avdol
  + Yes!
  + I!
  + Am!
+ Jojo!

> Jojo! This is the last of my hamon, take it from me!

```haskell
module Kira where
 data KillerQueue
```

**Everything above and this line should be reserved as ordinary markdown**

```agda
{-# OPTIONS --without-K #-}
module MdPreserveLit where
 open import Agda.Builtin.Nat
```

And then we have `_/2` in Agda!

```
_/2 : Nat → Nat
zero /2 = zero
suc zero /2 = zero
suc (suc n) /2 = suc (n /2)
```
