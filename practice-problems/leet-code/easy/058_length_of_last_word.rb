=begin
Title: Length of Last Word
Difficulty: Easy
Percent correct: 28.6%

Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

If the last word does not exist, return 0.

Note: A word is defined as a character sequence consists of non-space characters only.


For example, 
Given s = "Hello World",
return 5.
  Show Tags          String
=end

def length_of_last_word(string)
  return 0 if string.empty?
  string.split.last.length
end

p length_of_last_word("Hello world")
p length_of_last_word('')