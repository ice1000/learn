module Codewars.Kata.DNA where
import Codewars.Kata.DNA.Types

-- data Base = A | T | G | C
type DNA = [Base]

change :: Base -> Base
change A = T
change T = A
change G = C
change C = G

dnaStrand :: DNA -> DNA
dnaStrand = (change <$>)
