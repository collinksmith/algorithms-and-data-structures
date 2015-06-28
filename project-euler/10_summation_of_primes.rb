def summation_of_primes(n)
  primes = [2]
  until primes.last > n
    primes << next_prime(primes.last)
  end
  primes.pop
  primes.inject(:+)
end

def next_prime(num)
  loop do
    num += 1
    return num if is_prime?(num)
  end
end

def is_prime?(n)
    return n > 1 if n <=3
    return false if n % 2 == 0 || n % 3 == 0

    i = 5
    while i*i <= n 
        return false if (n % i == 0 || n % (i + 2) == 0)
        i += 6
    end
      
    true  
end

p summation_of_primes(2_000_000)