module Start

import StdEnv
import DataStructures
import Optics
//import FileReader

//Start world = readLabeledDatas "datas.txt" 2 world
//Start x = Distance (Vector[5.0]) (Vector[3.0])

Start x = EpsNeighbourhood (DataBase [Vector[0.0], Vector[1.0], Vector[2.0], Vector[3.0]]) 1.0 (Vector[1.0])
