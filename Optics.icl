implementation module Optics

import StdEnv
import DataStructures

:: MaybeReal = Undefined | Real Real

OPTICS :: Data Real Int -> [Data]
OPTICS data eps minPts = [GetNeighbours (hd data)]
where
    GetNeighbours :: Vector -> Data
    GetNeighbours p = [q \\ q <- data | Distance p q <= eps]

    CoreDistance :: Vector -> MaybeReal
    CoreDistance p
        # neighbours = GetNeighbours p
    | length neighbours < minPts = Undefined
    | otherwise                  = Sort neighbours p !! minPts
    where
        //QuickSort w.r.t. distance from p
        Sort :: Data -> Data
        Sort []     = []
        Sort [x:xs] = lt ++ eq ++ gt
        where
            lt = Sort [q \\ q <- data | Distance p q <  Distance p x]
            eq =      [q \\ q <- data | Distance p q == Distance p x]
            gt = Sort [q \\ q <- data | Distance p q >  Distance p x]


    ReachabilityDistance :: Vector Vector -> MaybeReal
    ReachabilityDistance p o
        # coreDistance = CoreDistance o
    | coreDistance == Undefined = Undefined
    | otherwise                 = Max coreDistance (Distance o p)
    where
        Max :: Real Real -> Real
        Max x y
        | x < y     = y
        | otherwise = x
