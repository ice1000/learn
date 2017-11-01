module StrictOrLazy where

veryBadBind :: IO () -> IO () -> IO ()
veryBadBind _ = id

badBind :: IO () -> IO () -> IO ()
badBind a b = a >>= const b

goodBind :: IO () -> IO () -> IO ()
goodBind a b = a >>= \() -> b

veryBadPut :: IO ()
veryBadPut = putStr "left " `veryBadBind` putStrLn "and right"

badPut :: IO ()
badPut = putStr "left " `badBind` putStrLn "and right"

goodPut :: IO ()
goodPut = putStr "left " `goodBind` putStrLn "and right"
