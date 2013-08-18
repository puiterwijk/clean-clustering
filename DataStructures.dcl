definition module DataStructures

import StdEnv
import StdMaybe

:: Vector :== [Real]
:: Data   :== [Vector]

:: VectorRecord = {
    value     :: Vector,
    coreDist  :: Maybe Real,
    reachDist :: Maybe Real,
    processed :: Bool
    }

Distance :: Vector Vector -> Real
