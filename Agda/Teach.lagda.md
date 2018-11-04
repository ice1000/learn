# Teach

## First, ....

+ Bla
+ Rua

```
module Teach where

open import Data.Nat
open import Relation.Binary.PropositionalEquality
```

## Then, bla

**Hey!!**

```
proof : ∀ n -> n + 0 ≡ n
proof zero = refl
proof (suc n) rewrite proof n = refl
```

