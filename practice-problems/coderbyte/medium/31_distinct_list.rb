=begin
Using the Ruby language, have the function DistinctList(arr) take the array of numbers stored in arr and determine the total number of duplicate entries. For example if the input is [1, 2, 2, 2, 3] then your program should output 2 because there are two duplicates of one of the elements. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def distinct_list(arr)
  duplicates = 0

  entries = Hash.new(0)

  arr.each do |entry|
    entries[entry] += 1
  end

  entries.each_value do |value|
    if value > 1
      duplicates += (value - 1)
    end
  end

  duplicates
end

p distinct_list([1,2,2,2,3,3,3,1,1,7,8,9])