class chapter_13(object):
    def __init__(self, list, hash, structure, tree):
        self.list = list
        self.hash = hash
        self.structure = structure
        self.tree = tree
    
cap = chapter_13([1,2,3], {1: 2}, None, None)
print(cap.__dict__)
# {'list': [1, 2, 3], 'hash': {1: 2}, 'structure': None, 'tree': None}
