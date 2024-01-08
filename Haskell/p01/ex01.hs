testTriangle :: Float -> Float -> Float -> Bool
testTriangle a b c = ((a + b) > c) && ((a + c) > b) && ((c + b) > a)