
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort lst = let pivot = head lst
                    left = filter (< pivot) lst
                    right = filter (> pivot) lst in
                  quickSort left ++ [pivot]  ++ quickSort right

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort [x, y] = if x < y then [x, y] else [y, x]
mergeSort lst = let midPoint = ((length lst) `div` 2)
                    firsHalf = mergeSort $ take midPoint lst
                    secondHalf = mergeSort $ drop midPoint lst in
                  merge firsHalf secondHalf

merge :: [Int] -> [Int] -> [Int]
merge a [] = a
merge [] b = b
merge a@(x:xs) b@(y:ys) = if x < y
                          then x : (merge xs b)
                          else y : (merge a ys)
