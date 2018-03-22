def divisible_triangular_number(n)
  addors = [1]

  loop do
    triangle = triangle_num(addors)
    return triangle if num_factors(triangle) > n
    addors << addors.last + 1
  end

end

def triangle_num(addors)
  addors.inject(:+)
end

def num_factors(num)
  factors = []
  i = 1
  while i * i < num
    factors << i if num % i == 0
    i += 1
  end
  factors.count * 2
end

p divisible_triangular_number(500)