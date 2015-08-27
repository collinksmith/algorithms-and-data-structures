=begin
Title: Plus One
Difficulty: Easy
Percent correct: 30.9%

Given a non-negative number represented as an array of digits, plus one to the number.

The digits are stored such that the most significant digit is at the head of the list.  Show Tags          Array        Math
=end

def plus_one(array)
  array.join.to_i + 1
end

p plus_one([1,2,3])