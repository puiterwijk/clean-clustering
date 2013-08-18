implementation module Optics

import StdEnv
import DataStructures

:: MaybeReal = Undefined | Real Real
:: VectorRecord = {
    value     :: Vector,
    coreDist  :: MaybeReal,
    reachDist :: MaybeReal,
    processed :: Boolean
}

OPTICS :: Data Real Int -> [Data]
OPTICS data eps minPts = OPTICS` Preprocess data
where
    
    Preprocess :: Data -> [VectorRecord]
    Preprocess [] = []
    Preprocess [v:vs] = [CreateVectorRecord v:Preprocess vs]

    CreateVectorRecord :: Vector -> VectorRecord
    CreateVectorRecord v = { value = v, coreDist = UNDEFINED, reachDist = UNDEFINED, processed = FALSE }

    OPTICS` :: [VectorRecord] [VectorRecord] -> [Data]
    OPTICS` processed [] = []
    OPTICS` [vr:vrs]
    | vr.processed == TRUE  = OPTICS` vrs
    | vr.processed == FALSE = [{vr & processed = TRUE }:OPTICS` vrs]
    /*
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
    */
