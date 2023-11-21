myand :: [Bool] -> Bool
myand [] = True
myand (l : r) = l && myand r

myor :: [Bool] -> Bool
myor [] = False
myor (l : r) = l || myor r

{-main = print(myor([True, True, True]))-}

myconcat :: [[a]] -> [a] 
myconcat [] = []
myconcat (l : r) = l ++ myconcat r

myreplicate :: Int -> a -> [a] 
myreplicate 0 l = []
myreplicate n l = l : myreplicate (n-1) l

{-main = print(myreplicate 3 "a")-}

(!!!) :: [a] -> Int -> a
(l : _) !!! 0 = l
r !!! n | n < 0 = error "invalid index"
(_ : r) !!! n = r !!! (n-1)

myelem :: Eq a => a -> [a] -> Bool
myelem e [] = False
myelem e (l : r) = (l == e) || myelem e r