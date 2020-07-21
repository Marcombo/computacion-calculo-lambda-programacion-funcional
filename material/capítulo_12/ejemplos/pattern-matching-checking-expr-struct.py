from pampy import match_value, _
    
def checkingExprStruct(expr):
    if match_value([_, _], expr)[0]:
        print('two-element-list')
    elif match_value([_, _, _], expr)[0]:
        print('three-element-list')
    elif match_value({_ : _}, expr)[0]:
        print('two-element-dict')
    else:
        print('not-match')
    
checkingExprStruct({"cálculo": "lambda"})
# two-element-dict
checkingExprStruct([1,2,3])
# three-element-list
checkingExprStruct([1,2])
# two-element-list
checkingExprStruct(1)
# not-match
