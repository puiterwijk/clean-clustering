implementation module PrioQueue

import StdEnv

:: PrioQueue k v :== [(k, v)]

push :: (PrioQueue k v) (k, v) -> PrioQueue k v     | < k
push _ _ = abort "no push yet"

pop :: (PrioQueue k v) -> ((PrioQueue k v), v)
pop _ = abort "no pop yet"
