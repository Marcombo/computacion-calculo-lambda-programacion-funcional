join :: (Int, Int) -> Int
join a = (fst a) + (snd a)
    
sumList :: [Int] -> [Int] -> [Int]
sumList a b = map join (zip a b)
    
main = print $ sumList [1,2,3] [1,2,3]
-- [2, 4, 6]
