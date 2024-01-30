myand :: [Bool] -> Bool
myand [] = False
myand (x:xs) = x && myand xs

myor :: [Bool] -> Bool
myor [] = False
myor (x:xs) = x || myor xs

myconcat :: [[a]] -> [a] 
myconcat [] = []
myconcat (lst:rest) = lst ++ myconcat rest

myreplicate :: Int -> a -> [a] 
myreplicate 0 l = []
myreplicate n l = l : myreplicate (n-1) l

(!!!) :: [a] -> Int -> a
(l : _) !!! 0 = l
r !!! n | n < 0 = error "invalid index"
(_ : r) !!! n = r !!! (n-1)

myelem :: Eq a => a -> [a] -> Bool
myelem e [] = False
myelem e (x:rest) = (x == e) || myelem e rest