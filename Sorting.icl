implementation module Sorting

import StdEnv

sort :: [a] -> [a] | < a
sort [] = []
sort [x:xs] = (sort smaller) ++ equal ++ (sort bigger)
where
    (smaller, equal, bigger) = compare x xs
    where
        compare :: a [a] -> ([a], [a], [a]) | < a
        compare _ [] = []
        compare x [y:ys]
        | y < x     = ([y:smaller], equal, bigger)
        | y > x     = (smaller, equal, [y:bigger])
        | othereise = (smaller, [y:equal], bigger)
        where
            (smaller, equal, bigger) = compare x ys
