definition module DataStructuren

import StdEnv

:: Data = Data [Real]
:: LabeledData = LabeledData Data Int

instance == Data
instance == LabeledData
