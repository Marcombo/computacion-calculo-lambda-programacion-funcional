lst = (1, 2, 3, 4, 5)
new_lst = lst[1:]
print(new_lst)
# (2, 3, 4, 5)
new_lst = tuple(v for v in lst if v != 4)
print(new_lst)
# (1, 2, 3, 5)
