definition module PrioQueue

import StdEnv

:: PrioQueue k v
push :: (PrioQueue k v) (k, v) -> PrioQueue k v | < k
pop :: (PrioQueue k v) -> ((PrioQueue k v), v)
toList :: (PrioQueue k v) -> [v]
