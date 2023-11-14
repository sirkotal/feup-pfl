halves :: [l] -> ([l], [l])
halves l = (take x l, drop x l) where x = length l `div` 2

{-main = print(halves [1,2,3,4,5,6,7,8])-}