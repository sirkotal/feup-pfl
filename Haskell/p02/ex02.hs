intersperse :: a -> [a] -> [a]
intersperse _ [] = []
intersperse _ (x:[]) = [x]
intersperse c (x:lst) = [x] ++ [c] ++ intersperse c lst

{-main = print(intersperse '-' "cena")-}