class node(object):
    def __init__(self, value, left = None, right = None):
        self.value = value
        self.left = left
        self.right = right
    
def create_binary_tree(lst):
    if not lst:
        return None
    if not lst[1:]:
        return node(lst[0])
    else:
        value = lst[0]
        tail = lst[1:]
        left = list(filter(lambda v: v < value, tail))
        right = list(filter(lambda v: v >= value, tail))
        return node(value, 
                    create_binary_tree(left), 
                    create_binary_tree(right))

tree = create_binary_tree((9, 7, 5, 1, 6, 8, 10, 11, 12))

def search(tree, value):
    if not tree or value == tree.value:
        return tree
    elif value > tree.value:
        return search(tree.right, value)
    else:
        return search(tree.left, value)
    
if search(tree, 10):
    print("found")
else:
    print("not found")
# found
