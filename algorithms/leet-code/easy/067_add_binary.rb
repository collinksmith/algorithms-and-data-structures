=begin
Title: Add Binary
Difficulty: Easy
Percent correct: 25.0%

Given two binary strings, return their sum (also a binary string).



For example,
a = "11"
b = "1"
Return "100".
  Show Tags          Math        String
=end

def add_binary(str1, str2)
  result = ''
  max_length = str1.length > str2.length ? str1.length : str2.length

  bin1 = pad_binary(str1, max_length).reverse
  bin2 = pad_binary(str2, max_length).reverse

  carry = 0
  idx = 0
  while idx < max_length || carry != 0
    if idx >= max_length
      addition = carry
    else
      addition = bin1[idx].to_i + bin2[idx].to_i + carry
    end

    case addition
    when 0
      result << '0'
      carry = 0
    when 1
      result << '1'
      carry = 0
    when 2
      result << '0'
      carry = 1
    when 3
      result << '1'
      carry = 1
    end

  idx += 1
  end

  result.reverse
end

def pad_binary(str, length)
  str.rjust(length, '0')
end

p add_binary('11', '1')
p add_binary('1110101', '111000')