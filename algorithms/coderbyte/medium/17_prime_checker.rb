=begin
Using the Ruby language, have the function PrimeChecker(num) take num and return 1 if any arrangement of num comes out to be a prime number, otherwise return 0. For example: if num is 910, the output should be 1 because 910 can be arranged into 109 or 019, both of which are primes. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def prime_checker(num)
  permutations = num.to_s.split('').permutation
  permutations = permutations.map { |number| number.join.to_i }
  permutations.each do |num|
    return 1 if is_prime?(num)
  end
  0
end

def is_prime?(num)
  return false if num == 2
  2.upto(num/2) do |i|
    return false if num % i == 0
  end
  true
end

p prime_checker(910)
p prime_checker(400)