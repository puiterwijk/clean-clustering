implementation module PrioQueue

import StdEnv

:: PrioQueue k v :== [(k, v)]

push :: (PrioQueue k v) (k, v) -> PrioQueue k v     | < k
push queue (key, value) = Bubble (length queue + 1) key queue ++ [(key, value)]
where
    Bubble :: Int k (PrioQueue k v) -> PrioQueue k v | < k
    Bubble i key queue
    | i == 0 = queue
        # j = ((i - 1) >> 1)
        # (parentKey, parentValue) = queue ! j
    | key < parentKey = Bubble key j (Swap queue i j)
    | otherwise = queue

pop :: (PrioQueue k v) -> ((PrioQueue k v), v)
pop [(key, value):xs] = (Sink 0 key xs, value)
where
    Sink :: Int k (PrioQueue k v) -> PrioQueue k v | < k
    Sink i key queue
        # left = 2 * i + 1
        # right = left + 1
    | left < length queue && 


kkk
Swap :: [a] i j -> [a]
Swap i j = ...
