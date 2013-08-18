module Test

import StdEnv
import DataStructures
import FileReader
import Optics

Start world
    # (data, world) = ReadFile "Test.txt" 3 world
= (length data, OPTICS data 1.0 4)
