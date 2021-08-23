increment :: Int -> Int
increment 10 = 10
increment n = increment (n + 1)
main = print $ increment 0
-- 10
