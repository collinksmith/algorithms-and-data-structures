=begin
Using the Ruby language, have the function BinaryConverter(str) return the decimal form of the binary value. For example: if 101 is passed return 5, or if 1000 is passed return 8. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def binary_converter(str)
  decimal_count = 0
  place = 0
  (str.length-1).downto(0) do |index|
    value = str[index]
    if value == '1'
      decimal_count += 2 ** place
    elsif value == '0'
    else
      return "That's an invalid binary number!"
    end
    place += 1
  end

  decimal_count
end

p binary_converter('1010')
p binary_converter('1000')
p binary_converter('11111111')