primeAux :: Integer -> [Integer]
primeAux 0 = [0]
primeAux 1 = [1]
primeAux n = [x | x <- [1..n], n `mod` x == 0]

prime :: Integer -> Bool
prime n = if length lst == 2
            then True
          else
            False
        where lst = primeAux n

main = print(prime 5)