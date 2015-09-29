def largest_prime_factor(n):
    test_n = n
    div = 2
    while div < test_n:
        if test_n % div == 0:
            test_n = test_n / div
        else:
            div += 1

    return test_n

print largest_prime_factor(13195)
print largest_prime_factor(600851475143)
