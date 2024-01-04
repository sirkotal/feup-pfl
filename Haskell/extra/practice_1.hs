type Species = (String, Int)

type Zoo = [Species]

isEndangered :: Species -> Bool
isEndangered (species, num) = if num >= 100
                                then False
                              else
                                True

updateSpecies :: Species -> Int -> Species
updateSpecies (species, num) x = (species, num + x)

filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] _ = []
filterSpecies (species:rest) func = if func species
                                        then [species] ++ filterSpecies rest func
                                    else
                                        filterSpecies rest func 

countAnimals :: Zoo -> Int
countAnimals animals = foldl (+) 0 (map (\(species, num) -> num) animals)

substring :: (Integral a) => String -> a -> a -> String
substring phrase start end = [phrase !! fromIntegral(i) | i <- [start..end]]