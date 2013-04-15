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
