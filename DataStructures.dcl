definition module DataStructures

import StdEnv

:: Vector :== [Real]
:: Data   :== [Vector]

:: VectorRecord = {
    value     :: Vector,
    coreDist  :: Maybe Real,
    reachDist :: Maybe Real,
    processed :: Boolean
}

Distance :: Vector Vector -> Real
