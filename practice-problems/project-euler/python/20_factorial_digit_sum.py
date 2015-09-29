def factorial_digit_sum(n):
    sum = 0
    factorial_str = str(factorial(n))
    for digit in factorial_str:
        sum += int(digit)
    return sum


def factorial(n):
    res = n
    i = n - 1
    while i > 0:
        res *= i
        i -= 1
    return res

print factorial_digit_sum(100)