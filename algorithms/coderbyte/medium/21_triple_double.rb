=begin
Using the Ruby language, have the function TripleDouble(num1,num2) take both parameters being passed, and return 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2. For example: if num1 equals 451999277 and num2 equals 41177722899, then return 1 because in the first parameter you have the straight triple 999 and you have a straight double, 99, of the same number in the second parameter. If this isn't the case, return 0. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def triple_double(num1, num2)
  unique_digits = num1.to_s.split('').uniq

  unique_digits.each do |digit|
    if repeat?(digit.to_i, num1, 3)
      return 1 if repeat?(digit.to_i, num2, 2)
    end
  end

  return 0
end

def repeat?(digit, number, repeats)
  count = 0

  number.to_s.split('').each do |num|
    if num.to_i == digit
      count += 1
      return true if count == repeats
    else
      count = 0
    end
  end 

  false 
end

p triple_double(451999277, 41177722899)
p triple_double(45111925, 41226166991)
p triple_double(411566, 4112611)
p triple_double(999, 99)