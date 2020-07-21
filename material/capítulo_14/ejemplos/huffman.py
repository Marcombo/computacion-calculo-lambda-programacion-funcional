sequence = 'AEEEADDECA'
    
class Tree(object):
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right
    
    def children(self):
        return (self.left, self.right)
    
def huffman_code_tree(node, binary=''):
    if type(node) is str:
        return { node: binary }
    if not node:
        return {}
    (left, right) = node.children()
    encoding = dict()
    encoding.update(huffman_code_tree(left, binary+'0'))
    encoding.update(huffman_code_tree(right, binary+'1'))
    return encoding
    
if len(sequence) == 0:
    raise Exception("Error. Sequence is empty")
freq = {}
for c in sequence:
    if c in freq:
        freq[c] += 1
    else:
        freq[c] = 1
    
freq = sorted(freq.items(), key=lambda x: x[1])
nodes = freq.copy()
    
if len(nodes) >= 2:
    (letter1, v1), (letter2, v2) = nodes[:2]
    tree = Tree(v1 + v2, letter1, letter2)
    nodes = nodes[2:]
else:
    (letter, value) = nodes[0]
    tree = Tree(value, letter)
    
for node in nodes:
    (letter, value) = node
    if tree.value <= value:
        tree = Tree(tree.value + value, tree, letter)
    else:
        tree = Tree(tree.value + value, letter, tree)
    
print(huffman_code_tree(tree))
# {'E': '0', 'C': '100', 'D': '101', 'A': '11'}
