module Codewars.Kata.Pagination where

type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n = ceiling $ (fromIntegral $ length xs) / (fromIntegral n)

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount [] _ _ = Nothing
pageItemCount xs n page = let p = pageCount xs n - 1 in
  if p == page
  then Just $ let x = mod (length xs) n in
    if 0 == x then n else x
  else if p < page || page < 0 then Nothing else Just n
--

pageIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex [] _ _ = Nothing
pageIndex xs n item = if length xs <= item
  then Nothing
  else Just $ max 0 $ div item n
--

