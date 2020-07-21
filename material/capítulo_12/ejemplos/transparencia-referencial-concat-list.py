def concat_list(lst1, lst2):
    return lst1 + lst2
    
def concat_list_v2(lst1, lst2):
    if not lst1:
        return lst2
    else:
        return [lst1[0]] + concat_list_v2(lst1[1:], lst2)
    
lst1 = [0, 1, 2]
lst2 = [3, 4, 5]
print(concat_list(lst1, lst2) == 
    concat_list_v2(lst1, lst2))
# True
