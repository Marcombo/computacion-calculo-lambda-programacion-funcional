def copyList(lst):
    return [element for element in lst]
    
a = [1,2,3]
b = copyList(a)
print(a == b)
# True
