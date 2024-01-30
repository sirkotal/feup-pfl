dec2int :: [Int] -> Int
dec2int lst = foldl (\x d -> x * 10 + d) 0 lst