module Codewars.Kata.Vowel where

isVowel a = elem a ['a', 'e', 'i', 'o', 'u']

count s = length . filter s

getCount :: String -> Int
getCount = count isVowel
