module Last where
import Prelude hiding (last)

last :: [a] -> a
last [a] = a
last (h:t) = last t
