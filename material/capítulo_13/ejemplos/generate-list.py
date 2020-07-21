def generateTuple(elem, limit):
    return ((elem),) * limit
    
print(generateTuple((1,2), 5))
# ((1, 2), (1, 2), (1, 2), (1, 2), (1, 2))
print(generateTuple(("a", "z"), 5))
# (('a', 'z'), ('a', 'z'), ('a', 'z'), ('a', 'z'), ('a', 'z'))
