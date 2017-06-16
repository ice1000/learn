module GuessTheArray where

guess :: Integral n => (Int -> Int -> n) -> Int -> [n]
guess f n=let t=div(f 0 1+f 1 2+f 0 2)2 in(t-f 1 2):(t-f 0 2):findN(n-2)(t-f 0 1)
  where findN i' l=if i'/=0 then let i=n-i' in l:(findN(i'-1)$(f i$i+1)-l)else[]
--
