divprop :: Integer -> [Integer]
divprop 0 = [0]
divprop n = [x | x <- [1..n], n `mod` x == 0 && x /= n]