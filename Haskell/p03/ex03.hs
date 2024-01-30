myzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipWith f [] _ = []
myzipWith f _ [] = []
myzipWith f (x:xs) (y:ys) = (f x y:myzipWith f xs ys) 