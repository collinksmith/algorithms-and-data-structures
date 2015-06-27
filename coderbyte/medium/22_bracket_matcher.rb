=begin
Using the Ruby language, have the function BracketMatcher(str) take the str parameter being passed and return 1 if the brackets are correctly matched and each one is accounted for. Otherwise return 0. For example: if str is "(hello (world))", then the output should be 1, but if str is "((hello (world))" the the output should be 0 because the brackets do not correctly match up. Only "(" and ")" will be used as brackets. If str contains no brackets return 1. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def bracket_matcher(str)
  open_brackets = 0

  str.split('').each do |character|
    if character == '('
      open_brackets += 1
    elsif character == ')'
      if open_brackets == 0
        return 0
      else
        open_brackets -= 1
      end
    end
  end

  open_brackets > 0 ? 0 : 1
end

p bracket_matcher("(hello (world))")
p bracket_matcher("((hello (world))")
p bracket_matcher(")()()()")