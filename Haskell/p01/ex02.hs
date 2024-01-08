areaTriangle :: Float -> Float -> Float -> Float
areaTriangle a b c = let s = (a + b + c) / 2 in sqrt(s * (s - a) * (s - b) * (s - c))

{-main = print(areaTriangle 2.0 3.0 4.0)-}