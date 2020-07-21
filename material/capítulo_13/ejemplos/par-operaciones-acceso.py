class pair(tuple):
    def __init__(self, args):
        if len(args) != 2:
            raise TypeError('pair debe contener dos elementos.')
    
    def first(self):
        return self.__getitem__(0)
    
    def second(self):
        return self.__getitem__(-1)
    
par = pair((1, 2))

print(par.first())
# 1
print(par.second())
# 2
