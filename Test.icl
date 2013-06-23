module Test

import StdEnv
import DataStructures
import FileReader
import Optics

Unique :: [a] -> [a] | == a
Unique [] = []
Unique [x:xs]
| True = [x:xs] //NYI

Start world
    # (data, world) = ReadFile "Test.txt" 3 world
= (length data, OPTICS data 1.0 4)
