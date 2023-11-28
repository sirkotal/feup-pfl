zipWithRec :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithRec f [] x = []
zipWithRec f x [] = []
zipWithRec f (x : xr) (y : yr) = f x y : zipWithRec f xr yr