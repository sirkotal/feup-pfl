areaTriangle :: Float -> Float -> Float -> Float
areaTriangle a b c = sqrt (s * (s - a) * (s - b) * (s - c)) where s = (a + b + c) / 2

{-main = print(areaTriangle 2.0 3.0 4.0)-}