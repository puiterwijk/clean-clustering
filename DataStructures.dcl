definition module DataStructures

import StdEnv
import StdMaybe

:: Vector :== [Real]
:: Data   :== [Vector]

:: VectorRecord = {
    value     :: Vector,
    reachDist :: Maybe Real,
    processed :: Bool
    }

Distance :: Vector Vector -> Real
