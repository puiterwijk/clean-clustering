implementation module KNN

import StdEnv


majorityVote :: [Data] -> Int
majorityVote ds = mode (datas ds)
	where
		datas :: [Data] -> [Int]
		datas []		= []
		datas [(D _ x):ds]	= [x] ++ datas ds
		mode :: [Int] -> Int
		mode get = mode` get []
			where
				mode` :: [Int] [(Int, Int)] -> Int
				mode` [] freq		= maxfreq freq 0 0
					where
						maxfreq :: [(Int, Int)] Int Int -> Int
						maxfreq [] ma _ = ma
						maxfreq [(a,b):ds] ma mb
						| mb < b	= maxfreq ds a b
						| otherwise	= maxfreq ds ma mb
				mode` [d:ds] freq	= mode` ds (newFreq freq d)
					where
						newFreq :: [(Int, Int)] Int -> [(Int, Int)]
						newFreq freqs foundNumber
						| isTupleMember freq foundNumber= updateFreqs freq foundNumber
						| otherwise			= [(foundNumber, 1)] ++ freqs
							where
								updateFreqs :: [(Int, Int)] Int -> [(Int, Int)]
								updateFreqs [] _	= []
								updateFreqs [(a,b):ds] found
								| a == found	= [(a,b+1)] ++ updateFreqs ds found
								| otherwise	= [(a,b)] ++ updateFreqs ds found
								isTupleMember :: [(a,b)] a -> Bool | == a
								isTupleMember [] _	= False
								isTupleMember [(a,b):ds] x = (a == x) || isTupleMember ds x


sortData :: [Data] UnknownData -> [Data]
sortData [] _	= []
sortData ds d	= [min] ++ sortData (removeMember min ds) d
	where
		min = minElement ds d
			where
				minElement :: [Data] UnknownData -> Data
				minElement [d:ds] x = minElement` ds x d
					where
						minElement` :: [Data] UnknownData Data -> Data
						minElement` [] _ min		= min
						minElement` [d:ds] x min
						| smaller x d min	= minElement` ds x d
						| otherwise		= minElement` ds x min
							where
								smaller :: UnknownData Data Data -> Bool
								smaller (U x) (D a _) (D b _)	= (eucDistance a x) < (eucDistance b x)

KNN :: [Data] UnknownData Int -> [Data]
KNN dataset toFind k = take k (sortData dataset toFind)

propose :: [Data] !Int UnknownData -> Int
propose dataset k toFind =  majorityVote filtered
	where
		filtered = KNN dataset toFind k
