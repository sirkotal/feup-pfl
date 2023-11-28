intersperse :: a -> [a] -> [a]
intersperse c [] = []
intersperse c [l] = [l]
intersperse c (l : r) = l : c : intersperse c r

{-main = print(intersperse '-' "cena")-}