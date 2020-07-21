class immutable_dict(dict):
    def __hash__(self):
        return id(self)
    
    def _immutable(self, *args, **kws):
        raise TypeError('immutable_dict is immutable')
    
    __setitem__ = _immutable
    __delitem__ = _immutable
    clear       = _immutable
    update      = _immutable
    setdefault  = _immutable
    pop         = _immutable
    popitem     = _immutable
    
table = immutable_dict({ ("a", "b", "c"): "d",
                            1: 2})
print(table)
# {('a', 'b', 'c'): 'd', 1: 2}
