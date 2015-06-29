def longest_collatz
  sequences = []

  999_999.downto(1).select(&:odd?).each do |n|
    sequences << collatz_sequence(n)
  end

  sequences.max_by(&:length)
end

def collatz_sequence(num)
  res = [num]
  until res.last == 1
    res.last.even? ? res << res.last / 2 : res << (res.last * 3) + 1
  end

  res
end

# def populate_array(top, bottom)
  # res = []
  # ((top - bottom)/2).times do
  #   res << top
  #   top -= 2
  # end
  # res

#   top.downto(bottom).select(&:even?)
# end

# start_time = Time.now
# p populate_array(999999, 499999)
# p "Took #{Time.now - start_time} seconds"

p longest_collatz