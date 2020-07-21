sumList :: [Int] -> Int
sumList (x:xs) = (sumList xs) + x
sumList [] = 0
main = print $ sumList [1,2,3]
-- 6
