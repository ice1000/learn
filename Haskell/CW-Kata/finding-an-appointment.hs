module FindingAnAppointment where

import Data.List

fromStr :: String -> Int
fromStr [a, b, _, c, d] = (read [a, b] :: Int) * 60 + (read [c, d] :: Int) - 540

format :: Int -> String
format i
  |i <= 9    = '0' : show i
  |otherwise = show i
--

makeStr :: Int -> String
makeStr ii = let i = ii + 540 in
  format (div i 60) ++ ":" ++ format (i `mod` 60)
--

between :: Int -> Int -> Int -> Bool
between a b c = c >= a && c < b

sampleData = [[("09:00", "11:30"),
               ("13:30", "16:00"),
               ("16:00", "17:30"),
               ("17:45", "19:00")]
             , [("09:15", "12:00"),
                ("14:00", "16:30"),
                ("17:00", "17:30")]
             , [("11:30", "12:15"),
                ("15:00", "16:30"),
                ("17:45", "19:00")]]
--

processSchedules :: [[(String, String)]] -> [Bool]
processSchedules ls = let x = ls >>= ((\(a, b) -> (fromStr a, fromStr b)) <$>)
                          y = [0 .. 599] in
  (\a -> any (\(b, c) -> between b c a) x) <$> y
--

getStartTime :: [[(String, String)]] -> Int -> Maybe String
getStartTime scd' duration = let scdP = processSchedules scd' in
  let scd = (\x -> (head x, length x)) <$> group scdP
      ls = takeWhile f scd in
      if ls == scd then Nothing
      else Just $ makeStr $ sum (snd <$> ls)
  where f = \(h, l) -> not (not h && l >= duration)
--
