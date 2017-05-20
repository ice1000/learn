module If where

_if :: Bool -> a -> a -> a
_if True x _ = x
_if False _ y = y
