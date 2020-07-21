from pampy import match, MatchError, _

def evaluate_pattern(expr, pattern, result):
    try:
    if match(expr, pattern, lambda x, y: x + y) == result:
        return 'match'
    except MatchError as e:
        return 'not-match', e
    
print(evaluate_pattern([1,2], [_, _], 3))
# match
print(evaluate_pattern([1, 2, 3], [_, _], 3))
# ('not-match', MatchError("'_' not provided. This case is not handled:\n[1, 2, 3]"))
