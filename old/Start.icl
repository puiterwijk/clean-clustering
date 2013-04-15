module Start

import KNN
import FileReader


//Start :: *World -> *(Int, *World)
Start world
# (datas, world)	= readDatas "trainset.txt" 2 world
# (tests, world)	= readTests "testset.txt" 2 world
= map (propose datas 2) tests
