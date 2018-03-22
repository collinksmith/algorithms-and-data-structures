=begin
Using the Ruby language, have the function LetterCount(str) take the str parameter being passed and return the first word with the greatest number of repeated letters. For example: "Today, is the greatest day ever!" should return greatest because it has 2 e's (and 2 t's) and it comes before ever which also has 2 e's. If there are no words with repeating letters return -1. Words will be separated by spaces. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def repeated_letters(word)
  letters = []
  repeats = []
  word.split('').each do |character|
    if letters.include?(character) && !repeats.include?(character)
      repeats << character
    elsif !letters.include?(character)
      letters << character
    else
    end
  end
  repeats.length
end


def letter_count(str)
  result = ''
  str.split.each do |word|
    result = word if repeated_letters(word) > repeated_letters(result)
  end
  return -1 if result == ''
  result
end

p letter_count("Today, is the greatest day ever!")
p letter_count("no reps in words")