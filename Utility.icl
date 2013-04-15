implementation module Utility

import StdEnv


eucDistance :: [Real] [Real] -> Real
eucDistance a b = sqrt (eucDist` a b)
    where
        eucDist` :: [Real] [Real] -> Real
        eucDist` [] []      = 0.0 
        eucDist` [] _       = abort "Error!"
        eucDist` _ []       = abort "Error!"
        eucDist` [a:as] [b:bs]  = (a-b)^2.0 + (eucDist` as bs) 


arrayDifference :: [a] [a] -> Int   | == a
arrayDifference [] []       = 0
arrayDifference [x:xs] []   = abort "Lists not of equal length!"
arrayDifference [] [x:xs]   = abort "Lists not of equal length!"
arrayDifference [a:as] [b:bs]
| a == b            = arrayDifference as bs
| otherwise         = 1 + arrayDifference as bs
