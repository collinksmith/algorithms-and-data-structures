=begin
MEDIUM

Using the Ruby language, have the function PrimeTime(num) take the num parameter being passed and return the string true if the parameter is a prime number, otherwise return the string false. The range will be between 1 and 2^16. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def prime_time(num)
  2.upto(num-1) do |test_num|
    return "false" if num % test_num == 0
  end
  return "true"
end
