implementation module DataStructuren

import StdEnv
import Utility


instance == Data
where
    (==) :: !Data !Data -> Bool
    (==) (Data x) (Data y) = x == y

instance == LabeledData
where
    (==) :: !LabeledData !LabeledData -> Bool
    (==) (LabeledData x c1) (LabeledData y c2)  = (x == y) && (c1 == c2)

instance distance Data
where
    distance :: !Data !Data -> Real
    distance (Data x) (Data y)  = eucDistance x y

instance distance LabeledData
where
    distance :: !LabeledData !LabeledData -> Real
    distance (LabeledData x c1) (LabeledData y c2)  = distance x y
