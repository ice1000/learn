module OddEven

-- open import Agda.Builtin.Nat renaming (suc to S; zero to Z)
-- open import Agda.Builtin.Equality
-- open import Function using (_$_)

-- Type = Set

data Even : Nat -> Type where
  -- | Zero is even.
  ZeroEven : Even Z
  -- | If n is even, then n+2 is even.
  NextEven : Even n -> Even (S (S n))

data Odd : Nat -> Type where
  -- | One is odd.
  OneOdd : Odd (S Z)
  -- | If n is odd, then n+2 is odd.
  NextOdd : Odd n -> Odd (S (S n))

-- variable n m : Nat

-- | Proves that if n is even, n+1 is odd.
-- Notice how I use the axioms here.
evenPlusOne : Even n -> Odd (S n)
evenPlusOne  ZeroEven    = OneOdd
evenPlusOne (NextEven n) = NextOdd $ evenPlusOne n

-- | Proves that if n is odd, n+1 is even.
oddPlusOne : Odd n -> Even (S n)
oddPlusOne  OneOdd     = NextEven $ ZeroEven
oddPlusOne (NextOdd n) = NextEven $ oddPlusOne n

-- | Proves even + even = even
evenPlusEven : Even n -> Even m -> Even (n + m)
evenPlusEven  ZeroEven    m = m
evenPlusEven (NextEven n) m = NextEven $ evenPlusEven n m

-- | Proves odd + odd = even
oddPlusOdd : Odd n -> Odd m -> Even (n + m)
oddPlusOdd  OneOdd     m = oddPlusOne m
oddPlusOdd (NextOdd n) m = NextEven $ oddPlusOdd n m

-- | Proves even + odd = odd
evenPlusOdd : Even n -> Odd m -> Odd (n + m)
evenPlusOdd  ZeroEven    m = m
evenPlusOdd (NextEven n) m = NextOdd $ evenPlusOdd n m

-- | Proves odd + even = odd
oddPlusEven : Odd n -> Even m -> Odd (n + m)
oddPlusEven  OneOdd     m = evenPlusOne m
oddPlusEven (NextOdd n) m = NextOdd $ oddPlusEven n m

-- | Proves even * even = even
evenTimesEven : Even n -> Even m -> Even (n * m)

-- | Proves odd * odd = odd
oddTimesOdd : Odd n -> Odd m -> Odd (n * m)

-- | Proves even * odd = even
evenTimesOdd : Even n -> Odd m -> Even (n * m)

-- | Proves odd * even = even
oddTimesEven : Odd n -> Even m -> Even (n * m)

helperOdd : Odd m -> Odd (m + 0)
helperOdd OneOdd = OneOdd
helperOdd (NextOdd x) = NextOdd (helperOdd x)

helperEven : Even m -> Even (m + 0)
helperEven ZeroEven = ZeroEven
helperEven (NextEven x) = NextEven (helperEven x)

evenTimesEven  ZeroEven    _ = ZeroEven
evenTimesEven (NextEven n) m = evenPlusEven m (oddTimesEven (evenPlusOne n) m)

oddTimesOdd  OneOdd     m = helperOdd m
oddTimesOdd (NextOdd n) OneOdd = NextOdd (oddTimesOdd n OneOdd)
oddTimesOdd (NextOdd n) (NextOdd m) = NextOdd (oddPlusEven m (NextEven (oddPlusOdd m (oddTimesOdd n (NextOdd m)))))

evenTimesOdd  ZeroEven    _ = ZeroEven
evenTimesOdd (NextEven n) m = oddPlusOdd m (oddTimesOdd (evenPlusOne n) m)

oddTimesEven  OneOdd     m = helperEven m
oddTimesEven (NextOdd n) ZeroEven = oddTimesEven n ZeroEven
oddTimesEven (NextOdd n) (NextEven m) = NextEven (evenPlusEven m (NextEven (evenPlusEven m (oddTimesEven n (NextEven m)))))
