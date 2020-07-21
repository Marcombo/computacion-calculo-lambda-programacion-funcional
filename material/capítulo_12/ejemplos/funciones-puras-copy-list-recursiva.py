def copyList(lst):
    if not lst:
        return []
    else:
        return copyList([lst[0]]) + copyList(lst[1:])
a = [1,2,3]
b = copyList(a)
print(a == b)
# True
