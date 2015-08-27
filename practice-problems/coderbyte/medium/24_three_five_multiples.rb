=begin
Using the Ruby language, have the function ThreeFiveMultiples(num) return the sum of all the multiples of 3 and 5 that are below num. For example: if num is 10, the multiples of 3 and 5 that are below 10 are 3, 5, 6, and 9, and adding them up you get 23, so your program should return 23. The integer being passed will be between 1 and 100. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def three_five_multiples(num)
  multiples = (1...num).select { |i| i % 3 == 0 || i % 5 == 0 }
  multiples.inject(:+)
end

p three_five_multiples(10)