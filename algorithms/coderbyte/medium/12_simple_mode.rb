=begin
Using the Ruby language, have the function SimpleMode(arr) take the array of numbers stored in arr and return the number that appears most frequently (the mode). For example: if arr contains [10, 4, 5, 2, 4] the output should be 4. If there is more than one mode return the one that appeared in the array first (ie. [5, 10, 10, 6, 5] should return 5 because it appeared first). If there is no mode return -1. The array will not be empty. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def simple_mode(array)
  number_counts = Hash.new(0)
  array.each do |number|
    number_counts[number] += 1
  end

  return -1 unless number_counts.values.max > 1

  most_frequent_numbers = []
  number_counts.each do |number, times|
    most_frequent_numbers << [number, times] if most_frequent_numbers.length == 0
    if times == most_frequent_numbers[0][1]
      most_frequent_numbers << [number, times] 
    elsif times > most_frequent_numbers[0][1]
      most_frequent_numbers = [[number, times]]
    end    
  end

  return most_frequent_numbers[0][0] if most_frequent_numbers.length == 1

  result = nil
  most_frequent_numbers.each do |element|
    number = element[0]
    index = array.index(number)
    if result == nil
      result = number
      next
    end

    result = number if index < array.index(result)
  end

  result
end

p simple_mode([10, 4, 5, 2, 4])
p simple_mode([5, 10, 10, 6, 5])
p simple_mode([1,5,8,2,3])