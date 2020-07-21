def pow(n, e):
    if e == 0:
        return 1
    elif e == 1: 
        return n
    else:
        return pow(n, e - 1) * n
    
print(pow(2, 4))
