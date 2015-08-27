=begin
Title: Valid Parentheses
Difficulty: Easy
Percent correct: 26.7%

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
  Show Tags          Stack        String
=end

def valid_parentheses(string)
  current = nil
  opening_characters = ['(', '[', '{']

  string.split('').each do |character|
    if current == nil
      return false unless opening_characters.include?(character)
      current = character
    else
      return false unless character == closing_character(current)
      current = nil
    end
  end

  true
end

def closing_character(opening_character)
  case opening_character
  when '(' then ')'
  when '[' then ']'
  when '{' then '}'
  end
end

p valid_parentheses("()[]{}")
p valid_parentheses("}{}()")
p valid_parentheses("{}(]")