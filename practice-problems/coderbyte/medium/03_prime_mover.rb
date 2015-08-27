=begin
MEDIUM

Using the Ruby language, have the function PrimeMover(num) return the numth prime number. The range will be from 1 to 10^4. For example: if num is 16 the output should be 53 as 53 is the 16th prime number. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def prime?(number)
  2.upto(number/2) do |i|
    return false if number % i == 0
  end
  true
end

def prime_mover(n)
  primes = []
  idx = 3
  while true
    primes << idx if prime?(idx)
    return idx if primes.length == n
    idx += 1
  end
end

p prime_mover(10)