def qsort(lst):
    if not lst:
        return lst
    pivot = lst[0]
    tail = lst[1:]
    lsr = list(filter(lambda v: v < pivot, tail))
    grt = list(filter(lambda v: v >= pivot, tail))
    return qsort(lsr) + [pivot] + qsort(grt)
    
print(qsort([9, 2, 1, 8, 3]))
# [1, 2, 3, 8, 9]
