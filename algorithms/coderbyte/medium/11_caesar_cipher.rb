=begin
Using the Ruby language, have the function CaesarCipher(str,num) take the str parameter and perform a Caesar Cipher shift on it using the num parameter as the shifting number. A Caesar Cipher works by shifting each letter in the string N places down in the alphabet (in this case N will be num). Punctuation, spaces, and capitalization should remain intact. For example if the string is "Caesar Cipher" and num is 2 the output should be "Ecguct Ekrjgt". 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def caesar_cipher(str, num)
  result = ''
  str.split('').each do |character|
    unless character.between?("A", "Z") || character.between?("a", "z")
      result << character
      next
    end

    new_character_ord = character.ord + num

    if character.between?("A", "Z")
      new_character_ord -= 26 if new_character_ord > "Z".ord
    end

    if character.between?("a", "z")
      new_character_ord -= 26 if new_character_ord > "z".ord
    end

    result << new_character_ord.chr
  end
  
  result
end

p caesar_cipher("Caesar, Cipher!", 2)