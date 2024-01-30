insert :: Ord a => a -> [a] -> [a] 
insert n (x:y:rest) = if n >= x && n <= y
                        then (x:n:y:rest)
                      else
                        [x] ++ insert n (y:rest)

{-main = print(insert 2 [0,1,3,5])-}

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:rest) = insert x (isort rest)

main = print(isort [10,2,4,0,1,3,5])