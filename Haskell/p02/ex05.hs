myminimum :: Ord a => [a] -> a
myminimum [n] = n
myminimum (n:rest) = min n (myminimum rest)

delete :: Eq a => a -> [a] -> [a]
delete _ [] = []
delete n (x:rest) = case n == x of
                        True -> rest
                        False -> [x] ++ delete n rest