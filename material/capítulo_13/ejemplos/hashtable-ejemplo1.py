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
    
table = immutable_dict({ 'cálculo': "lambda" })
print(table)
# {'cálculo': 'lambda'}
table["a"] = "b"
# error, porque este diccionario es inmutable.
