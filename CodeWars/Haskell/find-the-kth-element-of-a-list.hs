module Kth where
import Prelude hiding ((!!))

elementAt :: [a] -> Int -> a
elementAt ls 1 = head ls
elementAt ls n = elementAt (tail ls) (n - 1)
