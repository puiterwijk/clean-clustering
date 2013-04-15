implementation module FileReader

import StdEnv
import DataStructuren


readDatas :: String Int *World -> ([Data], *World)
readDatas filename numPoints world
# (ok,infile,world)	= sfopen filename FReadText world
| not ok		= abort "Error opening file"
# (tests,file)		= readDataFile infile numPoints
= (tests, world)

readLabeledDatas :: String Int *World -> ([LabeledData], *World)
readLabeledDatas filename numPoints world
# (ok,infile,world)	= sfopen filename FReadText world
| not ok		= abort "Error opening file"
# (datas,file)		= readLabeledDataFile infile numPoints
= (datas, world)

readDataFile :: File Int -> ([Data], File)
readDataFile file numPoints
| sfend file	= ([], file)
# (data, file)	= readDataLine file numPoints
# (rest, file)	= readDataFile file numPoints
= ([data] ++ rest, file)
	where
		readDataLine :: File Int -> (Data, File)
		readDataLine file numPoints
		# (reals,file)	= readReals file numPoints
		# (_,file)	= sfreadline file
		= ((Data reals), file)

readLabeledDataFile :: File Int -> ([LabeledData], File)
readLabeledDataFile file numPoints
| sfend file	= ([], file)
# (data, file)	= readLabeledDataLine file numPoints
# (rest, file)	= readLabeledDataFile file numPoints
= ([data] ++ rest, file)
	where
		readLabeledDataLine :: File Int -> (LabeledData, File)
		readLabeledDataLine file numPoints
		# (reals,file)	= readReals file numPoints
		# (ok,cls,file)	= sfreadi file
		| not ok	= abort "File error"
		# cls = IF_INT_64_OR_32 ((cls<<32)>>32) cls	//sfreadi bug fix
		# (_,file)	= sfreadline file
		= ((LabeledData (Data reals) cls), file)

readReals :: File Int -> ([Real], File)
readReals file 0	= ([], file)
readReals file n
# (ok,new,file)	= sfreadr file
# (rest,file)	= readReals file (n-1)
= ([new] ++ rest, file)
