module MoleculeToAtoms where

import Data.Char
import Data.List
import Data.Map hiding (map)

invalid = Left "Not a valid molecule"
mismatch = Left "Mismatched parenthesis"

i :: Char -> Int
i c = read [c] :: Int

s :: Char -> Char -> Int
s c1 c2 = read [c1, c2] :: Int

u :: Char -> Bool
u = isUpper

l :: Char -> Bool
l = isLower

n :: Char -> Bool
n = isDigit

lb :: Char -> Bool
lb c = elem c ['(', '[', '{']

rb :: Char -> Bool
rb c = elem c [')', ']', '}']

mt :: Char -> Char
mt ')' = '('
mt ']' = '['
mt '}' = '{'
mt '(' = ')'
mt '[' = ']'
mt '{' = '}'
mt  _  = ' '

parseRec :: [Int] -> [Char] -> String -> Either String [(String, Int)]
parseRec bases [] [] = Right []
parseRec bases _  [] = Right []
parseRec bases braces [a]
  |u a         = Right [([a], 1)]
  |lb a        = if head braces == mt a then Right [] else mismatch
  |otherwise   = invalid
parseRec bases braces [a, b]
  |l a && u b  = Right [([b, a], base)]
  |n a && u b  = Right [([b], base * i a)]
  |lb a        = if braces /= [] &&  head braces == mt a
                 then parseRec (tail bases) (tail braces) [b]
                 else mismatch
  where base = product bases
        f = parseRec bases braces
parseRec bases braces (a : (b : (c : d)))
  |u a         = (([a], base) :) <$> f (b : c : d)
  |l a && u b  = (([b, a], base) :) <$> f (c : d)
  |n a && u b  = (([b], base * i a) :) <$> f (c : d)
  |n a && n b && u c = (([c], base * s b a) :) <$> f d
  |n a && l b && u c = (([c, b], i a * base) :) <$> f d
  |n a && rb b = parseRec (i a : bases) (b : braces) (c : d)
  |rb a        = parseRec bases (a : braces) (b : c : d)
  |lb a        = if braces /= [] && head braces == mt a
                 then parseRec (tail bases) (tail braces) (b : c : d)
                 else mismatch
  |otherwise   = invalid
  where f = parseRec bases braces
        base = product bases
--

collapseSame :: [(String, Int)] -> [(String, Int)]
collapseSame [] = []
collapseSame [a] = [a]
collapseSame (a : (b : c))
  |fst a == fst b = collapseSame ((fst a, snd a + snd b) : c)
  |otherwise      = a : collapseSame (b : c)

mapResult :: Either String [(String, Int)] -> Either String [(String, Int)]
mapResult (Left err)     = Left err
mapResult (Right origin) = Right $ map (\k -> (k, collapsed ! k)) keys
  where keys             = nub $ map fst origin
        collapsed        = fromList $ collapseSame $ sort origin
--

parseMolecule :: String -> Either String [(String, Int)]
parseMolecule formula = mapResult $ reverse <$> (parseRec [] [] $ reverse formula)

