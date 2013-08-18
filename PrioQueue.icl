implementation module PrioQueue

import StdEnv

:: PrioQueue k v = Leaf | Node k [v] (PrioQueue k v) (PrioQueue k v)

empty :: PrioQueue k v
empty = Leaf

push :: (PrioQueue k v) (k, v) -> PrioQueue k v | < k
push Leaf (k, v) = Node k [v] Leaf Leaf
push (Node kn vn left right) (k, v)
| k > kn    = Node kn vn left (push right (k, v))
| k < kn    = Node kn vn (push left (k, v)) right
| otherwise = Node kn [v:vn] left right

pop :: (PrioQueue k v) -> ((PrioQueue k v), v)
pop Leaf = abort "Help... We got into an empty tree??"
pop (Node k [v] Leaf Leaf) = (Leaf, v)
pop (Node k [v] left Leaf) = (left, v)
pop (Node k [v:vs] left Leaf) = (Node k vs left Leaf, v)
pop (Node k v left right) = (Node k v left newright, element)
where
    (newright, element) = pop right

toList :: (PrioQueue k v) -> [v]
toList Leaf = []
toList (Node _ vs left right) = (toList left) ++ vs ++ (toList right)
