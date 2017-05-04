module Codewars.Lambda4fun.ParseHtmlColor where
-- module A where

import Codewars.Lambda4fun.ParseHtmlColor.PresetColors (presetColors)
import Data.Char (toLower, digitToInt)
import Data.List (insert)
import Data.Map.Strict (Map, fromList, (!))

parseHtmlColor :: String -> Map Char Int
parseHtmlColor ('#':t) = fromList $ parseCssColor t
parseHtmlColor s       = parseHtmlColor $ presetColors ! (map toLower s)
--

dti = digitToInt

parseCssColor :: String -> [(Char, Int)]
parseCssColor [r1, r2, g1, g2, b1, b2] = [('r', dti r2 + 16 * dti r1), ('g', dti g2 + 16 * dti g1), ('b', dti b2 + 16 * dti b1)]
parseCssColor [r, g, b] = [('r', 17 * dti r), ('g', 17 * dti g), ('b', 17 * dti b)]

