maxpos :: [Int] -> Int
maxpos lst = if val > 0
                then val
             else
                0
            where val = foldl max 0 lst

dups :: [a] -> [a]
dups lst = aux lst True

aux :: [a] -> Bool -> [a]
aux [] _ = []
aux (x:rest) flag = case flag of
                    True -> (x:x:aux rest False)
                    False -> (x:aux rest True)

transform :: String -> String
transform [] = []
transform (x:rest) = if x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' 
                        then (x:'p':x:transform rest)
                     else
                        (x:transform rest)

type Vector = [Int]
type Matrix = [[Int]]

transpose :: Matrix -> Matrix
transpose [] = []
transpose m = if (head m) == [] 
                then []
              else
                (map head m) : transpose (map tail m)

prodIntern :: Vector -> Vector -> Int
prodIntern [] [] = 0
prodIntern (x:v1) (y:v2) = (x*y) + prodIntern v1 v2