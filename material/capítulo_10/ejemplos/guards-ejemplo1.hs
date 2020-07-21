last :: [Int] -> Int
last (x:xs) 
    | length xs == 0 = x
    | otherwise = (f xs)
    
main = print $ last [1,2,3]
-- 3
