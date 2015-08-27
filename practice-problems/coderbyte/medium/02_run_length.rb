=begin
MEDIUM

Using the Ruby language, have the function RunLength(str) take the str parameter being passed and return a compressed version of the string using the Run-length encoding algorithm. This algorithm works by taking the occurrence of each repeating character and outputting that number along with a single character of the repeating sequence. For example: "wwwggopp" would return 3w2g1o2p. The string will not contain any numbers, punctuation, or symbols. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def run_length(str)
  result = ''
  count = 0
  previous = nil
  str.split('').each_with_index do |character, index|
    if index == 0
      previous = character
      count += 1 
     unless str[index+1] == character
        result << "#{count.to_s}#{previous}"
      end
    elsif index == str.length - 1
      previous = character
      count += 1
      result << "#{count.to_s}#{previous}"    
    elsif character == previous
      count += 1
      unless str[index+1] == character
        result << "#{count.to_s}#{previous}"
      end
    else
      previous = character
      count = 1
      unless str[index+1] == character
        result << "#{count.to_s}#{previous}"
      end
    end
  end

  result
end

p run_length('wwwggopp')
p run_length('wgggoooop')