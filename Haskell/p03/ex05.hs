-- a) --

maximumAlt :: Ord a => [a] -> a
maximumAlt = foldr1 max

minimumAlt :: Ord a => [a] -> a
minimumAlt = foldr1 min