roots :: Float -> Float -> Float -> (Float, Float)
roots a b c = ((-b + delta) / (2*a), (-b - delta) / (2*a)) where delta = sqrt((b*b) - (4*a*c))