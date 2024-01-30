type Book = (String,[String],String)

myBooks :: [Book]
myBooks =
  [
  ("the da vinci code",["Dan Brown"],"a mystery thriller set after a murder in french soil"),
  ("the lost prologue",["Danilo Silverio","Dan Brown"],"a novel about how a wonderful language came to be"),
  ("war and peace",["Lev Tolstoy"],"a war story on the french invasion of russia")
  ]

containsWord :: Book -> String -> Bool
containsWord (name, authors, text) word = containsWordAux word lst where lst = words (name ++ " " ++ text)

containsWordAux :: String -> [String] -> Bool
containsWordAux _ [] = False
containsWordAux w (x:rest) = if w == x
                                then True
                               else
                                containsWordAux w rest

testBooks :: [Book] -> String -> String -> Bool
testBooks lst a b = if [book | book <- lst, containsWord book a] == [anotherbook | anotherbook <- [book | book <- lst, containsWord book a], containsWord anotherbook b]
                        then True
                    else
                        False

myIntersperse :: a -> [a] -> [a]
myIntersperse c [] = []
myIntersperse c [x] = [x]
myIntersperse c (x:rest) = (x:c:myIntersperse c rest)

parseBexp :: String -> Bexp
parseBexp value = case (readMaybe value)::Maybe Bool of Just flag -> BooleanConst flag
                                          Nothing -> BooleanVar value

squareMatrix :: Int -> [[Int]]
squareMatrix n = squareMatrixAux n 1 z s where z = n*n
                                               s = n

squareMatrixAux :: Int -> Int -> Int -> Int -> [[Int]]
squareMatrixAux n acc z s = if acc <= z
                            then ([x | x <- [acc..n]]:squareMatrixAux (n+s) (n+1) z s)
                          else
                            []

aToB :: Int -> Int -> (Int -> Bool) -> [Int]
aToB x y func = calcAux x y 1 [n | n <- [1..], func n]

calcAux :: Int -> Int -> Int -> [Int] -> [Int]
calcAux x y acc (n:rest) = if acc >= x && acc <= y
                            then [n] ++ calcAux x y (acc+1) rest
                           else if acc > y
                            then []
                           else
                            calcAux x y (acc+1) rest