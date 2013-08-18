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
    OPTICS` db eps minPts
    # pid = find_unprocessed db
    | pid == -1  = [] //We have no more items to process, be done!
    # p = db!!p
    # neighbors = getNeighbours p db eps minPts
    # p = {p & processed = True}
    # db = updateAt pid p db
    # coreDist = CoreDistance neighbours p eps minPts
    | coreDist == Nothing   = [p: OPTICS`` db eps minPts]
    | otherwise = [p: use_seeds neighbours p eps minPts db]

    use_seeds :: [VectorRecord] VectorRecord Real Int [VectorRecord] [VectorRecord]
    use_seeds N p eps minPts unprocessed db
    # seeds = empty
    # (seeds, N) = update N p seeds eps minPts
    # returned = 


    update :: [VectorRecord] VectorRecord 
    





    CoreDistance :: [VectorRecord] Int VectorRecord -> Maybe Real
    CoreDistance neighbours minPts p
    | length neighbours < minPts = Nothing
    | otherwise                  = Just ((sort neighbours p) !! minPts)


    getNeighbours :: VectorRecord [VectorRecord] Real -> [VectorRecord]
    getNeighbours p db eps
    = toList distances
    where
        distances = getDistances p db eps empty

    getDistances :: VectorRecord [VectorRecord] Real (PrioQueue Real VectorRecord) -> (PrioQueue Real VectorRecord)
    getDistances _ [] _ q = q
    getDistances p [x:xs] eps q = getDistances p xs eps (push q ((Distance p.value x.value), x))
