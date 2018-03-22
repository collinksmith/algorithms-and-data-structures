=begin
Using the Ruby language, have the function StringReduction(str) take the str parameter being passed and return the smallest number you can get through the following reduction method. The method is: Only the letters a, b, and c will be given in str and you must take two different adjacent characters and replace it with the third. For example "ac" can be replaced with "b" but "aa" cannot be replaced with anything. This method is done repeatedly until the string cannot be further reduced, and the length of the resulting string is to be outputted. For example: if str is "cab", "ca" can be reduced to "b" and you get "bb" (you can also reduce it to "cc"). The reduction is done so the output should be 2. If str is "bcab", "bc" reduces to "a", so you have "aab", then "ab" reduces to "c", and the final string "ac" is reduced to "b" so the output should be 1. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def string_reduction(str)
  all_letters = ['a','b','c']

  i = 0
  while i < str.length
    if i == 0
      i += 1
      next
    end
    
    if str[i-1] != str[i]
      new_letter = all_letters - [str[i-1], str[i]]
      str = [[str[0...i-1]] << [new_letter] << [str[i+1..-1]]].flatten
      i -= 2
    end

  i += 1
  end

  str.length
end

p string_reduction('aa')
p string_reduction('ac')
p string_reduction('cab')
p string_reduction('bcab')
p string_reduction('aaab')