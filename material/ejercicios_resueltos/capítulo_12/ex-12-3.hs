-- |
-- >>> copyList [1, 2, 3]
-- [1,2,3]
copyList :: [a] -> [a]
copyList [] = []
copyList (x:xs) = [x] ++ copyList xs

-- |
-- >>> mapIncrement [1, 2, 3]
-- [2,3,4]
mapIncrement :: [Int] -> [Int]
mapIncrement = map (1 +)

-- |
-- >>> reduce (+) [1, 2, 3]
-- 6
reduce :: (a -> a -> a) -> [a] -> a
reduce f [x] = x
reduce f (x:y:xs) = reduce f ((f x y) : xs)

-- |
-- >>> filterGt0 [1, -2, 3]
-- [1,3]
filterGt0 :: [Int] -> [Int]
filterGt0 = filter (> 0)

-- |
-- >>> checkStructure [1]
-- "singleton list"
-- >>> checkStructure [1, 2]
-- "two elements list"
checkStructure :: [a] -> String
checkStructure [x] = "singleton list"
checkStructure [x, y] = "two elements list"
checkStructure _ = "unknown type"

-- |
-- >>> checkAndRrsult [10,10]
-- Just "is twenty"
-- >>> checkAndRrsult [15,15]
-- Just "is thirty"
-- >>> checkAndRrsult [1,12]
-- Nothing
-- >>> checkAndRrsult [12]
-- Nothing
checkAndRrsult :: [Int] -> Maybe String
checkAndRrsult [x, y]
  | sumIs 20 = Just "is twenty"
  | sumIs 30 = Just "is thirty"
    where elSum = x + y
          sumIs = (elSum ==)
checkAndRrsult _ = Nothing

-- |
-- >>> head $ listInfinite 1
-- 1
-- >>> take 2 $ listInfinite 1
-- [1,2]
listInfinite :: Int -> [Int]
listInfinite x = [x..]

-- |
-- >>>sumEqual 5 10 $ 3 + 2 + 10
-- True
sumEqual :: Int -> Int -> Int -> Bool
sumEqual a b result = (a + b) == result

-- |
-- >>> concatList [0..2] [3..5]
-- [0,1,2,3,4,5]
-- >>> 
-- 
concatList :: [a] -> [a] -> [a]
concatList = (++)
