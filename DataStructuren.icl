implementation module DataStructuren

import StdEnv


instance == Data
where
    (==) :: !Data !Data -> Bool
    (==) (Data x) (Data y) = x == y

instance == LabeledData
where
    (==) :: !LabeledData !LabeledData -> Bool
    (==) (LabeledData x c1) (LabeledData y c2)  = (x == y) && (c1 == c2)


eucDistance :: [Real] [Real] -> Real
eucDistance a b = sqrt (eucDist` a b)
    where
        eucDist` :: [Real] [Real] -> Real
        eucDist` [] []      = 0.0 
        eucDist` [] _       = abort "Error!"
        eucDist` _ []       = abort "Error!"
        eucDist` [a:as] [b:bs]  = (a-b)^2.0 + (eucDist` as bs) 

