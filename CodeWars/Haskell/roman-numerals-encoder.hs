module RomanNumerals where

romanString = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

romanDigit :: [Integer]
romanDigit  = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

subtrahend :: Integer -> (Integer, String)
subtrahend n = head (dropWhile (\(a, _) -> a > n) $ zip romanDigit romanString)

convert :: Integer -> (Integer, String)
convert 0 = (0, [])
convert n = let (i, st) = subtrahend n in
  let (i1, st1) = convert (n - i) in (i1, st ++ st1)
--

solution :: Integer -> String
solution n = snd $ convert n
