module Its.Timmys.Fault.Again where

createList :: Int -> [Int]
createList 0 = []
createList n = take n [1..]
