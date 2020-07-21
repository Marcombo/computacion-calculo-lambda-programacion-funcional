isEven :: Int -> Bool
isEven a = a `mod` 2 == 0
    
join :: (Int, Int) -> Int
join a = (fst a) + (snd a)
    
sumList :: [Int] -> [Int] -> [Int]
sumList a b = filter (isEven) (map join (zip a b))
main = print $ sumList [1,2,3] [1,2,4]
-- [2, 4]
