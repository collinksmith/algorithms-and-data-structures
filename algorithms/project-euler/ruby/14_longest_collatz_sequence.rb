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

p longest_collatz
