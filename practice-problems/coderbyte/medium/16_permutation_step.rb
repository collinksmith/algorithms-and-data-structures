=begin
Using the Ruby language, have the function PermutationStep(num) take the num parameter being passed and return the next number greater than num using the same digits. For example: if num is 123 return 132, if it's 12453 return 12534. If a number has no greater permutations, return -1 (ie. 999). 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def my_permutations(array)
  result = []
  if array.length == 1
    return array[0]
  elsif array.length == 2
    return [array[0], array[1]], [array[1], array[0]]
  else
    result << [permutations([array[0]...array[array.length/2]]), permutations([array[array.length/2]..array[-1]])]
    result << [permutations([array[array.length/2]..array[-1]]), permutations([array[0]...array[array.length/2]])]
  end
  result
end


def get_permutations(num)
  result = []
  digits = num.to_s.split('')

  max_index = num.to_s.length-1
  digits.each_with_index do |digit, index|
    other_nums = digits.delete_at(index)
    other_nums_permutations = permutations(other_nums)
    other_nums_permutations.each do |permutation|
      result << permutation.unshift(digit)
    end
  end
end

def permutation_step(num)
  permutations = num.to_s.split('').permutation
  permutations = permutations.map { |number| number.join.to_i }.sort
  permutations[permutations.index(num)+1]
end

p permutation_step(12453)