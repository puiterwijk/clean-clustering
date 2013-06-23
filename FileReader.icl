implementation module FileReader

import StdEnv
import DataStructures

ReadFile :: String Int *World -> (Data, *World)
ReadFile fileName numPoints world
    # (ok, infile, world) = sfopen fileName FReadText world
| not ok = abort "Error opening file"
    # (data, file)        = ReadData infile numPoints
= (data, world)

ReadData :: File Int -> (Data, File)
ReadData file numPoints
| sfend file = ([], file)
    # (vector, file) = ReadVector file numPoints
    # (data,   file) = ReadData   file numPoints
= ([vector] ++ data, file)

ReadVector :: File Int -> (Vector, File)
ReadVector file numPoints
    # (vector, file) = ReadReals file numPoints
    # (_,      file) = sfreadline file
= (vector, file)

ReadReals :: File Int -> ([Real], File)
ReadReals file 0 = ([], file)
ReadReals file n
    # (ok, new, file) = sfreadr file
| not ok = abort "Malformed data file"
    # (reals, file)   = ReadReals file (n - 1)
= ([new] ++ reals, file)
