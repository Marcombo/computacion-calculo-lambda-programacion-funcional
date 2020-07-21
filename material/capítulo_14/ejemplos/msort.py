def merge_list(left, right):
    if not left or not right:
        return left + right
    else:
        fa = left[0]
        fb = right[0]
    if fa < fb:
        return [fa] + merge_list(left[1:], right)
    else:
        return [fb] + merge_list(left, right[1:])
    
def msort(lst):
    if len(lst) <= 1:
        return lst
    else:
        middle = round(len(lst) / 2)
        left = lst[:middle]
        right = lst[-(len(lst) - middle):]
        return merge_list(msort(left), msort(right))
    
print(msort([9, 2, 1, 8, 3]))
# [1, 2, 3, 8, 9]
