=begin
Title: Count and Say
Difficulty: Easy
Percent correct: 25.7%

The count-and-say sequence is the sequence of integers beginning as follows:
1, 11, 21, 1211, 111221, ...



1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.



Given an integer n, generate the nth sequence.



Note: The sequence of integers will be represented as a string.

  Show Tags          String
=end

def nth_count_and_say(n)
  sequence = ''

  n.times do
    sequence = count_and_say(sequence)
  end

  sequence
end

def count_and_say(sequence)
  return '1' if sequence == ''

  result = ''
  count = 0
  counting = nil

  sequence.split('').each_with_index do |character, index|
    if index == sequence.length - 1
      if count == 0
        result << '1'
        result << character
      elsif counting == character
        count += 1
        result << count.to_s
        result << character
      else
        result << count.to_s
        result << counting
        result << '1'
        result << character
      end
    else  
      if count == 0
        counting = character
        count += 1
      elsif counting == character
        count += 1
      else
        result << count.to_s
        result << counting
        counting = character
        count = 1
      end    
    end
  end

  result
end

p nth_count_and_say(1)
p nth_count_and_say(2)
p nth_count_and_say(3)
p nth_count_and_say(4)
p nth_count_and_say(5)
p nth_count_and_say(6)