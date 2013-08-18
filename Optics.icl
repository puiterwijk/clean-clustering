implementation module Optics

import StdEnv
import DataStructures
import PrioQueue

OPTICS :: Data Real Int -> [VectorRecord]
OPTICS data eps minPts = OPTICS` ([{value     = x,
                                    coreDist  = Nothing,
                                    reachDist = Nothing,
                                    processed = False} \\ x <- data]) eps minPts
where
    OPTICS` :: [VectorRecord] Real Int -> [VectorRecord]
    OPTICS` db eps minPts = OPTICS`` db eps minPts [] db
    where
        // First argument is toProcess
        OPTICS`` :: [VectorRecord] Real Int [VectorRecord] [VectorRecord] -> [VectorRecord]
        OPTICS`` [] _ _ processed _ = processed
        OPTICS`` [vr:vrs] eps minPts processed db
        # neighbors = getNeighbours vr db eps minPts
        # vr = {vr & processed = True}
        # processed = [vr : processed]
        # seeds = zero
        // TODO
        = OPTICS`` vrs eps minPts processed db

        update :: [VectorRecord] VectorRecord (PrioQueue Real VectorRecord) Real Int
        update neighbours p seeds eps minPts
        # coreDist = CoreDistance neighbours minPts p
        | coreDist == Nothing = seeds
        | otherwise           = update` coreDist p neighbours seeds
        where
            update` Real VectorRecord [VectorRecord] (PrioQueue Real VectorRecord)
            update` _ _ [] seeds = seeds
            update` coreDist p [o:os] seeds
            | o.processed = seeds
            | otherwise   = update`` coreDist p o seeds
            where
                update`` :: Real VectorRecord VectorRecord (PrioQueue Real VectorRecord) -> (PrioQueue Real VectorRecord)
                update coreDist p o seeds
                # reachDist = ReachabilityDistance p o
                | o.reachDist == Nothing = 
                | reachDist < o.reachDist = 

        CoreDistance :: [VectorRecord] Int VectorRecord -> Maybe Real
        CoreDistance neighbours minPts p
        | length neighbours < minPts = Nothing
        | otherwise                  = Just (Sort neighbours p ! minPts)
        #coreDist =


        getNeighbours :: VectorRecord [VectorRecord] Real -> [VectorRecord]
        getNeighbours p db eps
        = toList distances
        where
            distances = getDistances p db eps empty

        getDistances :: VectorRecord [VectorRecord] Real (PrioQueue Real VectorRecord) -> (PrioQueue Real VectorRecord)
        getDistances _ [] _ q = q
        getDistances p [x:xs] eps q = getDistances p xs eps (push q ((Distance p.value x.value), x))

    /*
        GetNeighbours :: Vector -> Data
        GetNeighbours p = [q \\ q <- data | Distance p q <= eps]

        CoreDistance :: Vector -> Maybe Real
        CoreDistance p
            # neighbours = GetNeighbours p
        | length neighbours < minPts = Nothing
        | otherwise                  = Just (Sort neighbours p !! minPts)
        where
            //QuickSort w.r.t. distance from p
            Sort :: Data -> Data
            Sort []     = []
            Sort [x:xs] = lt ++ eq ++ gt
            where
                lt = Sort [q \\ q <- data | Distance p q <  Distance p x]
                eq =      [q \\ q <- data | Distance p q == Distance p x]
                gt = Sort [q \\ q <- data | Distance p q >  Distance p x]


        ReachabilityDistance :: Vector Vector -> Maybe Real
        ReachabilityDistance p o
            # coreDistance = CoreDistance o
        | coreDistance == Nothing = Nothing
        | otherwise                 = Max coreDistance (Distance o p)
        where
            Max :: Real Real -> Real
            Max x y
            | x < y     = y
            | otherwise = x
        */
