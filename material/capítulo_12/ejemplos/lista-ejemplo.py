lst = [1, 2, 3, 4, 5]
print(lst[0])
# 1

print(lst[1:])
# [2, 3, 4, 5]

print(lst[-1])
# 5

new_lst = [lst[0]] + lst[1:]
print(lst == new_lst)
# True
