implementation module DataStructures

import StdEnv

Distance :: Vector Vector -> Real
Distance [] [] = 0.0
Distance [x:xs] [y:ys] = Abs (x - y) + Distance xs ys
where
    Abs :: Real -> Real
    Abs x
    | x < 0.0    = ~x
    | otherwise  = x
