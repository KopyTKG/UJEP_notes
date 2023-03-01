s1 = ["Alena", "Petr", "Pavel"]
s2 = ["Alena", "Pavel", "Petr"]
s3 = ["Petr", "Milan", "Pavel", "Pavel"]


def fa(s1, s2, s3):
    full = s1 + s2 + s3
    count = {}
    for name in full:
        if name in count:
            count[name] += 1
        else:
            count[name] = 1
        maxVal = 0
    for line in count:
        if count[line] > maxVal:
            maxVal = count[line]
    return {name for name in count if count[name]==maxVal}


a = fa(s1, s2, s3)

print(a)