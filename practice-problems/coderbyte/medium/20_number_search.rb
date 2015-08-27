=begin
Using the Ruby language, have the function NumberSearch(str) take the str parameter, search for all the numbers in the string, add them together, then return that final number divided by the total amount of letters in the string. For example: if str is "Hello6 9World 2, Nic8e D7ay!" the output should be 2. First if you add up all the numbers, 6 + 9 + 2 + 8 + 7 you get 32. Then there are 17 letters in the string. 32 / 17 = 1.882, and the final answer should be rounded to the nearest whole number, so the answer is 2. Only single digit numbers separated by spaces will be used throughout the whole string (So this won't ever be the case: hello44444 world). Each string will also have at least one letter. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def number_search(str)
  (sum_of_numbers(str).to_f / number_of_letters(str)).round
end

def number_of_letters(str)
  letter_count = 0

  str.split('').each do |character|
    letter_count += 1 if character =~ /[a-z]/ || character =~ /[A-Z]/
  end

  letter_count
end

def sum_of_numbers(str)
  numbers = []
  str.split('').each do |character|
    numbers << character.to_i if character =~ /\d/
  end

  numbers.inject(:+)
end

p number_search("Hello6 9World 2, Nic8e D7ay!")