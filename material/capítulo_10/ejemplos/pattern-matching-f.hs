f :: Int -> Int
f 0 = 0
f n = f (n - 1) + n
main = print $ f 5 
-- 15
