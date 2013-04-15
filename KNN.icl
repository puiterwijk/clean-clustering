implementation module KNN

import StdEnv
import DataStructuren
import Utility


KNN :: !Int [LabeledData] Data -> Int
KNN k dataset toFind = majorityVote filtered
    where
        filtered = KNN` k dataset toFind

        KNN` :: !Int [LabeledData] Data -> [LabeledData]
        KNN` k dataset toFind = take k (sortLabeledData dataset toFind)


majorityVote :: [LabeledData] -> Int
majorityVote ds = mode (classes ds) 
    where
        classes :: [LabeledData] -> [Int]
        classes []        = []
        classes [(LabeledData _ x):ds]  = [x] ++ classes ds
        mode :: [Int] -> Int
        mode get = mode` get []
            where
                mode` :: [Int] [(Int, Int)] -> Int
                mode` [] freq       = maxfreq freq 0 0 
                    where
                        maxfreq :: [(Int, Int)] Int Int -> Int
                        maxfreq [] ma _ = ma
                        maxfreq [(a,b):ds] ma mb
                        | mb < b    = maxfreq ds a b 
                        | otherwise = maxfreq ds ma mb
                mode` [d:ds] freq   = mode` ds (newFreq freq d)
                    where
                        newFreq :: [(Int, Int)] Int -> [(Int, Int)]
                        newFreq freqs foundNumber
                        | isTupleMember freq foundNumber= updateFreqs freq foundNumber
                        | otherwise         = [(foundNumber, 1)] ++ freqs
                            where
                                updateFreqs :: [(Int, Int)] Int -> [(Int, Int)]
                                updateFreqs [] _    = []
                                updateFreqs [(a,b):ds] found
                                | a == found    = [(a,b+1)] ++ updateFreqs ds found
                                | otherwise = [(a,b)] ++ updateFreqs ds found
                                isTupleMember :: [(a,b)] a -> Bool | == a
                                isTupleMember [] _  = False
                                isTupleMember [(a,b):ds] x = (a == x) || isTupleMember ds x

sortLabeledData :: [LabeledData] Data -> [LabeledData]
sortLabeledData [] _   = []
sortLabeledData ds d   = [min] ++ sortLabeledData (removeMember min ds) d
    where
        min = minElement ds d
            where
                minElement :: [LabeledData] Data -> LabeledData
                minElement [d:ds] x = minElement` ds x d
                    where
                        minElement` :: [LabeledData] Data LabeledData -> LabeledData
                        minElement` [] _ min        = min
                        minElement` [d:ds] x min
                        | smaller x d min   = minElement` ds x d
                        | otherwise     = minElement` ds x min
                            where
                                smaller :: Data LabeledData LabeledData -> Bool
                                smaller (Data x) (LabeledData (Data a) _) (LabeledData (Data b) _)   = (eucDistance a x) < (eucDistance b x)

