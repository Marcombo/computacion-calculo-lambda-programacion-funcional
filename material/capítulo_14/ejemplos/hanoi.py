def hanoi(n, source, dest, aux):
    if n == 1:
        print("Mover disco 1 desde origen {} al destino {}".format(source, dest))
    else:
        hanoi(n-1, source, aux, dest)
        print("Mover disco {} desde origen {} al destino {}".format(n, source, dest))
        hanoi(n-1, aux, dest, source)
    
hanoi(3, "A", "C", "B")
# Mover disco 1 desde origen A al destino C
# Mover disco 2 desde origen A al destino B
# Mover disco 1 desde origen C al destino B
# Mover disco 3 desde origen A al destino C
# Mover disco 1 desde origen B al destino A
# Mover disco 2 desde origen B al destino C
# Mover disco 1 desde origen A al destino C