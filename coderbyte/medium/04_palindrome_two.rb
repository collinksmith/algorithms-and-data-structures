=begin
MEDIUM

Using the Ruby language, have the function PalindromeTwo(str) take the str parameter being passed and return the string true if the parameter is a palindrome, (the string is the same forward as it is backward) otherwise return the string false. The parameter entered may have punctuation and symbols but they should not affect whether the string is in fact a palindrome. For example: "Anne, I vote more cars race Rome-to-Vienna" should return true. 

Use the Parameter Testing feature in the box below to test your code with different arguments..
=end

def palindrome_two(str)
  str = str.gsub(/[ \-,.$#\:]/, '').downcase
  (0..(str.length-1)/2).each do |i|
    return "false" unless str[i] == str[-(i+1)]
  end
  return "true"
end

p palindrome_two("Anne, I vote more cars race Rome-to-Vienna")