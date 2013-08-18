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
    | coreDist == Nothing   = [p: OPTICS`` vrs eps minPts db]
    | otherwise = [p: use_seeds neighbours vr eps minPts vrs db]

    use_seeds :: [VectorRecord] VectorRecord Real Int [VectorRecord] [VectorRecord]
    use_seeds N p eps minPts unprocessed db
    # seeds = empty
    # (seeds, N) = update N p seeds eps minPts
    # returned = 


    update :: [VectorRecord] VectorRecord 

