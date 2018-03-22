def mult_of_3_or_5(n):
    sum = 0
    i = 1
    while i < n:
        if i % 3 == 0 or i % 5 == 0:
            sum += i
        i += 1

    return sum

print mult_of_3_or_5(1000)
