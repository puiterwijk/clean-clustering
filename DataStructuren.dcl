definition module DataStructuren

import StdEnv

:: Data = Data [Real]
:: LabeledData = LabeledData Data Int

instance == Data
instance == LabeledData

class distance a :: !a !a -> Real
instance distance Data
instance distance LabeledData
