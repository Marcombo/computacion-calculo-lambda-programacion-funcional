def karp_rabin(T, P, b, q):
    #q = número primo
    #b = número base
    n = len(T)
    m = len(P)
    if m > n:
        return -1
    
    d = (b**(m-1)) % q
    h_y = 0
    h_x = 0
    
    #preprocesamiento
    for i in range(0, m):
        h_y += (ord(T[i]) * (b**(m - i - 1)))
        h_x += (ord(P[i]) * (b**(m - i - 1)))
        
    h_y = h_y % q
    h_x = h_x % q
    
    for i in range(0, n - m + 1):
        if h_y == h_x:
            if P == T[i: i + m]:
                print("Encontrado:", i)
                return i
        elif i + m < n:
            h_y = (h_y + b * q - ord(T[i]) * d) % q
            h_y = (h_y * b + ord(T[i + m])) % q
            i += 1
    
    return -1
    
result = karp_rabin("cálculo lambda!", "lambda", 256, 8355967)
print(result)
# Encontrado: 8
