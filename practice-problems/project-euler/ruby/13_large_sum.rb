nums = File.readlines('13_50_digit_numbers.txt').map { |line| line.chomp.to_i }
sum = nums.inject(:+)
p sum.to_s[0..9]