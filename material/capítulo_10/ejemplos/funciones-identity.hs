identity :: Int -> Int
identity x = x 
    
getIdentity :: (Int -> (Int -> Int))
getIdentity n = identity 
    
main = print $ ((getIdentity 0) 1)
-- 1
