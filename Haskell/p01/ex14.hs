short :: [a] -> Bool
short [] = True
short (x:[]) = True
short (x:y:[]) = True
short (x:y:z:[]) = True
short _ = False