implementation module Optics

import StdEnv
import DataStructures

:: MaybeReal = Undefined | Real Real

//Returns list of clusters and list of noise points
OPTICS :: Data Real Int -> ([Data], Data)
OPTICS data eps minPts = Cluster [] [] (map (\v = (v, Undefined)) data)
where

    /* Input: 
     *  1 List of clusters
     *  2 List of noise points
     *  3 Unprocessed data points, paired with their reachability distance
     */
    Cluster :: [Data] Data [(Data, MaybeReal)] -> ([Data], Data)
    Cluster clusters noise [] = (clusters, noise)
    Cluster clusters noise [(x,r):xs]
        # neighbours = GetNeighbours data x
    | length neighbours < minPts  = Cluster clusters [x:noise] xs
        # seeds      = []
    | otherwise                   = Update neighbours x

    /* Input
     *  1 Unprocessed neighbours
     *  2 Vector
     */
    Update :: Data Vector -> ([Data], Data)
    Update neighbours x
        # coreDist = CoreDistance x
    Update x unprocessed
    = 

    
    GetNeighbours :: Data Vector -> Data
    GetNeighbours data p = [q \\ q <- data | Distance p q <= eps]

    CoreDistance :: Vector -> MaybeReal
    CoreDistance p
        # neighbours = GetNeighbours data p
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
