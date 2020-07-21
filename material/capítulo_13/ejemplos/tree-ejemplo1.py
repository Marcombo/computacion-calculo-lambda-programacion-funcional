class node(object):
    def __init__(self, value, left = None, right = None):
        self.value = value
        self.left = left
        self.right = right
    
tree = node(9, 
        node(7, 
            node(5, 
            node(1), node(6)), 
            node(8)),
        node(10, 
            None, 
            node(11, 
            None, 
            node(12))))
