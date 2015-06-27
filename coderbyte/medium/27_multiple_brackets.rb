=begin
Using the Ruby language, have the function MultipleBrackets(str) take the str parameter being passed and return 1 #ofBrackets if the brackets are correctly matched and each one is accounted for. Otherwise return 0. For example: if str is "(hello [world])(!)", then the output should be 1 3 because all the brackets are matched and there are 3 pairs of brackets, but if str is "((hello [world])" the the output should be 0 because the brackets do not correctly match up. Only "(", ")", "[", and "]" will be used as brackets. If str contains no brackets return 1. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def multiple_brackets(str)
  count = 0
  open_parentheses = 0
  open_brackets = 0

  str.split('').each do |character|
    case character
    when '('
      open_parentheses += 1
    when '['
      open_brackets += 1
    when ')'
      return 0 unless open_parentheses > 0
      open_parentheses -= 1
      count += 1
    when ']'
      return 0 unless open_brackets > 0
      open_brackets -= 1
      count += 1
    else
    end
  end

  return 0 if open_parentheses > 0 || open_brackets > 0
  return 1 if count == 0
  "1 #{count}"
end

p multiple_brackets("(hello [world])(!)")
p multiple_brackets("((hello [world])")
p multiple_brackets("no brackets here!")