dec2int :: [Int] -> Int
dec2int = foldl (\x b -> x * 10 + b) 0