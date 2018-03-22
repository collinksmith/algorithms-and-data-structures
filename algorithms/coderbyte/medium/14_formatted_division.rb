=begin
Using the Ruby language, have the function FormattedDivision(num1,num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas and 4 significant digits after the decimal place. For example: if num1 is 123456789 and num2 is 10000 the output should be "12,345.6789". The output must contain a number in the one's place even if it is a zero. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def break_into_threes(string)
  if string.length < 3
    return number
  end

  result = []
  counter = string.length-1
  while counter >= 2 
    result << string[counter-2..counter]
    counter -= 3
  end

  result << string[0..counter] if counter >= 0

  result
end


def formatted_division(num1, num2)
  result = num1.to_f / num2.to_f
  result = result.to_s

  result = result << '.0000' unless result =~ /\./
  result << '0' if result[-2] == '.'
  result << '00' if result[-3] == '.'
  result << '000' if result[-4] == '.'

  digits_after_decimal = result.match(/\d+\.(\d+)/)[1]
  if digits_after_decimal.length > 4
    new_digits_after_decimal = result.match(/\d+\.(\d{4})\d+/)[1]
  else
    new_digits_after_decimal = result.match(/\d+\.(\d+)/)[1]
  end

  digits_before_decimal = result.match(/(\d+)\.\d+/)[1]
  array_of_threes = break_into_threes(digits_before_decimal)

  new_digits_before_decimal = ''
  (array_of_threes.length-1).downto(0) do |index|
    if index == 0
      new_digits_before_decimal << array_of_threes[index] 
      next
    end
    new_digits_before_decimal << array_of_threes[index] + ','
  end

  result = new_digits_before_decimal + '.' + new_digits_after_decimal
  result
end

p formatted_division(123456789, 10000)
p formatted_division(28386018,2984)