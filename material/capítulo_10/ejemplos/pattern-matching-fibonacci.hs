f :: Int -> Int
f 0 = 0
f 1 = 1
f n = f (n - 1) + f(n - 2)
main = print $ f 7
-- 13
