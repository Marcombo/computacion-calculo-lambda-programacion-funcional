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

create_binary_tree((9, 7, 5, 1, 6, 8, 10, 11, 12))
