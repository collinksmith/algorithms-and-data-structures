=begin
Using the Ruby language, have the function ArrayAddition(arr) take the array of numbers stored in arr and return the string true if any combination of numbers in the array can be added up to equal the largest number in the array, otherwise return the string false. For example: if arr contains [4, 6, 23, 10, 1, 3] the output should return true because 4 + 6 + 10 + 3 = 23. The array will not be empty, will not contain all the same elements, and may contain negative numbers. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def possible_combos(array)
  combos = []
  last_index = array.length-1

  0.upto(last_index) do |idx1|
    idx1+1.upto(last_index) do |idx2|
      combos << array[idx1..idx2]

      last_index.downto(idx2+2) do |idx4|
        combos << [array[idx1..idx2], array[idx4..last_index]].flatten
      end
    end

    last_index.downto(idx1+1) do |idx3|
      combos << [idx1, array[idx3..last_index]].flatten
    end
  end

  combos.each do |combo|
    combo.delete_if {|num| num == array.max}
  end

  combos
end

def array_addition(array)
  possible_combos(array).each do |combo|
    return "true, winning array is #{combo}" if combo.inject(:+) == array.max
  end
  "false"
end

p array_addition([4, 6, 23, 10, 1, 3])
p array_addition([500, 5, 1, 7, 1, 19, 30])