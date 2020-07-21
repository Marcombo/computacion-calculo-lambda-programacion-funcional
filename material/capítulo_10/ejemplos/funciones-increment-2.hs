increment :: Int -> Int
increment n = increment (n + 1)
increment 10 = 10
main = print $ increment 0
-- 10
