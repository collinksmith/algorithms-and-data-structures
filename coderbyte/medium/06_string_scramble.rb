=begin
Using the Ruby language, have the function StringScramble(str1,str2) take both parameters being passed and return the string true if a portion of str1 characters can be rearranged to match str2, otherwise return the string false. For example: if str1 is "rkqodlw" and str2 is "world" the output should return true. Punctuation and symbols will not be entered with the parameters. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def string_scramble(str1, str2)
  str1, str2 = str1.split(''), str2.split('')
  str2.each do |character|
    return "false" unless str1.include?(character)
    str1.delete_at(str1.index(character))
  end
  "true"
end

p string_scramble("rkqodlw", "world")
p string_scramble("djal", "hello")