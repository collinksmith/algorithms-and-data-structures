def sum_square_difference(num)
  square_of_sum(num) - sum_of_squares(num)
end

def sum_of_squares(num)
  (1..num).map {|n| n ** 2 }.inject(:+)
end

def square_of_sum(num)
  (1..num).inject(:+) ** 2
end

p sum_square_difference(100)