fromNumbersToListString :: [Int] -> [String]
fromNumbersToListString x = map show x
    
main = print $ fromNumbersToListString [123, 321]
-- [“123”, “321”]
