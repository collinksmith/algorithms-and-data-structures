def permutations(arr):
    if len(arr) <= 1:
        return [arr]
    lower_perms = permutations(arr[:-1])
    new_el = arr[-1]
    res = []
    for perm in lower_perms:
        i = 0
        perm_len = len(perm)
        while i <= perm_len:
            new_perm = list(perm)
            new_perm.insert(i, new_el)
            res.append(new_perm)
            i += 1
    return res

res = permutations([1, 2, 3])
print res
print len(res)