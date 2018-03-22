def n_prime(n)
  primes = [2]
  until primes.length == n
    primes << next_prime(primes.last)
  end

  primes.last
end

def next_prime(num)
  loop do
    num += 1
    return num if is_prime?(num)
  end
end

def is_prime?(num)
  (2..num/2).each { |i| return false if num % i == 0 }
  true
end

p n_prime(10001)