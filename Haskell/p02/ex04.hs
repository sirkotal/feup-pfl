insert :: Ord a => a -> [a] -> [a] 
insert x [] = [x]
insert x (l : r) = if x <= l
                    then x : l : r
                   else
                    l : insert x r

{-main = print(insert 2 [0,1,3,5])-}

isort :: Ord a => [a] -> [a]
isort [] = []
isort (l : r) = insert l (isort r)

main = print(isort [10,2,4,0,1,3,5])