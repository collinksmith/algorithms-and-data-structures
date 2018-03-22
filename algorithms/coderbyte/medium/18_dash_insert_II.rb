=begin
Using the Ruby language, have the function DashInsertII(str) insert dashes ('-') between each two odd numbers and insert asterisks ('*') between each two even numbers in str. For example: if str is 4546793 the output should be 454*67-9-3. Don't count zero as an odd or even number. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def dash_insert_II(str)
  result = ''

  str.split('').each_with_index do |digit, index|
    if index == 0
      result << digit
    elsif is_odd?(digit.to_i) && is_odd?(str[index-1].to_i)
      result << "-#{digit}"
    elsif is_even?(digit.to_i) && is_even?(str[index-1].to_i)
      result << "*#{digit}"
    else
      result << digit
    end
  end

  result
end

def is_odd?(num)
  return true if num % 2 == 1
  false
end

def is_even?(num)
  return true if num % 2 == 0 && num != 0
  false
end

p dash_insert_II('4546793')
p dash_insert_II('04268000103570')