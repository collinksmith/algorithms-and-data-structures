def largest_palindrome_project(n)
  first_num = ('9' * n).to_i
  second_num = first_num

  palindromes = []

  first_num.downto(1).each do |i|
    second_num.downto(1).each do |j|
      product = i * j
      palindromes << product if palindrome?(product.to_s)
    end
  end

  palindromes.max
end

def palindrome?(str)
  str == str.reverse ? true : false
end

p largest_palindrome_project(3)

