=begin
Using the Ruby language, have the function SwapII(str) take the str parameter and swap the case of each character. Then, if a letter is between two numbers (without separation), switch the places of the two numbers. For example: if str is "6Hello4 -8World, 7 yes3" the output should be 4hELLO6 -8wORLD, 7 YES3. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def swap_II(str)
  str = swap_case(str)
  swap_numbers(str)
end

def swap_case(str)
  result = ''

  str.split('').each do |character|
    if character =~ /[A-Z]/
      result << (character.ord + ('a'.ord - 'A'.ord)).chr
    elsif character =~ /[a-z]/
      result << (character.ord + ('A'.ord - 'a'.ord)).chr
    else
      result << character
    end
  end

  result
end

def swap_numbers(str)
  first_num = nil
  first_num_index = nil
  second_num = nil
  second_num_index = nil

  str.split('').each_with_index do |character, index|
    if character =~ /\d/
      if first_num.nil?
        first_num, first_num_index = character, index
      else
        second_num, second_num_index = character, index
        str[first_num_index] = second_num
        str[second_num_index] = first_num
        first_num, first_num_index, second_num, second_num_index = nil, nil, nil, nil
      end
    elsif character =~ /\w/
      next
    else
        first_num, first_num_index = nil, nil
    end
  end

  str
end

p swap_II("6Hello4 -8World, 7 yes3")