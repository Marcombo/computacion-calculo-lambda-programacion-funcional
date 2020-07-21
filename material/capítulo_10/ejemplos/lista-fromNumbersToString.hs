join :: [String] -> String
join ls = foldl (++) "" ls
    
fromNumbersToString :: [Int] -> String
fromNumbersToString x = join (map show x)
    
main = print $ fromNumbersToString [1, 2, 3, 4, 5]
-- “12345”
