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

def dict_remove(imm_dict, key):
    temp_dict = imm_dict.copy()
    if key in temp_dict:
        del temp_dict[key]
    return immutable_dict(temp_dict)
    
table_3 = dict_remove(table, ('a', 'b', 'c'))
print(table_3)
# {1: 2}
print(table)
# {('a', 'b', 'c'): 'd', 1: 2}
