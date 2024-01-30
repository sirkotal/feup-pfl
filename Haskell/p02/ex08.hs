dotprod :: [Float] -> [Float] -> Float
dotprod [] _ = 0
dotprod _ [] = 0
dotprod (x:l1) (y:l2) = (x*y) + dotprod l1 l2