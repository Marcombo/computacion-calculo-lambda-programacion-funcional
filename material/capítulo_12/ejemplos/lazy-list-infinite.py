from collections.abc import Sequence 
class LazyList(Sequence): 
    def __init__(self, it): 
        self.it = it 
        self._cache = []
    
    def __getitem__(self, index):
        while len(self._cache) <= index: 
            self._cache.append(next(self.it))
        return self._cache[index]
    
    def __len__(self): 
        return len(self._cache) 
    
def generator():
    number = 1
    while True:
        yield number
        number += 1
    
numbers = LazyList(generator())
print(numbers)
# <LazyList object>
print(numbers[0])
# 1
print(len(numbers))
# 1
print(numbers[1])
# 2
print(len(numbers))
# 2
