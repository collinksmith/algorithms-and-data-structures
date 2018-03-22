def smallest_multiple(n)
  i = n * (n - 1)

  loop do
    n.downto(2).each do |j|
      break if i % j != 0
      return i if j == 2
    end
    i += n
  end
end

p smallest_multiple(20)