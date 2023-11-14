testTriangle :: Float -> Float -> Float -> Bool
testTriangle a b c = ((a+b) > c) && ((a+c) > b) && ((b+c) > a)