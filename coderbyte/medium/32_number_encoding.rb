=begin
Using the Ruby language, have the function NumberEncoding(str) take the str parameter and encode the message according to the following rule: encode every letter into its corresponding numbered position in the alphabet. Symbols and spaces will also be used in the input. For example: if str is "af5c a#!" then your program should return 1653 1#!. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end
Alphabet = {'a' => 1,
'b' => 2, 
'c' => 3,
'd' => 4,
'e' => 5,
'f' => 6,
'g' => 7,
'h' => 8,
'i' => 9,
'j' => 10,
'k' => 11,
'l' => 12,
'm' => 13,
'n' => 14,
'o' => 15,
'p' => 16,
'q' => 17,
'r' => 18,
's' => 19,
't' => 20,
'u' => 21,
'v' => 22,
'w' => 23,
'x' => 24,
'y' => 25,
'z' => 26}


def number_encoding(str)
  result = ''

  str.split('').each do |character|
    if Alphabet.keys.include?(character)
      result << Alphabet[character].to_s
    else
      result << character
    end
  end

  result
end

def alt_number_encoding(str)
  result = ''

  str.split('').each do |character|
    if character =~ /[a-z]/
      result << (character.ord - 'a'.ord + 1).to_s
    elsif character =~ /[A-Z]/
      result << (character.ord - 'A'.ord + 1).to_s
    else
      result << character
    end
  end

  result
end

p number_encoding("af5c a#!")
p alt_number_encoding("af5c a#!")