module Test

import StdEnv
import DataStructures
import FileReader
import Optics

Start world
    # (data, world) = ReadFile "Test.txt" 3 world
    # (clusters, noise) = OPTICS data 1.0 4
= (length data, length clusters, length noise)
