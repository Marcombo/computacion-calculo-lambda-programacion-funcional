def ackermann(m, n):
    if m == 0:
        return n + 1
    if n == 0:
        return ackermann(m - 1, 1)
    scd_arg = ackermann(m, n - 1)
    return ackermann(m - 1, scd_arg)
    

if __name__ == '__main__':
    print(ackermann(2, 5))
