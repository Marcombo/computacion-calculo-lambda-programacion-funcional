f :: Int -> String
f v
    | v >= 18 && v < 65 = "Es adulto."
    | v >= 65           = "Es de la tercera edad."
    | otherwise         = "Es un menor o adolescente o algún alienígena."
    
main = print $ f 80
-- "Es de la tercera edad."
