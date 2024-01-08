lcd :: Integer -> Integer -> Integer
lcd a b = case b of 
            0 -> a 
            _ -> lcd b (a `mod` b)