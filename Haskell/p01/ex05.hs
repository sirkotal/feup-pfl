binom :: Integer -> Integer -> Integer
binom n k = product [1..n] `div` ((product [1..k]) * (product [1..x])) where x = n - k