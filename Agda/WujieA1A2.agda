module WujieA1A2 where

data B : Set where
  bb : B
  wanabbbeeeee : B

-- GADT
data A1 : (b : B) → Set where
  --      ^^^^^^^ index
  a11 : A1 bb
  a12 : A1 wanabbbeeeee
-- ADT
data A2 (b : B) : Set where
  --    ^^^^^^^ parameter
  a21 : A2 b
  a22 : A2 b → A2 b

f : A1 bb → Set
f a11 = A1 bb
