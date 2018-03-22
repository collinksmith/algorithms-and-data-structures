=begin
Using the Ruby language, have the function Consecutive(arr) take the array of integers stored in arr and return the minimum number of integers needed to make the contents of arr consecutive from the lowest number to the highest number. For example: If arr contains [4, 8, 6] then the output should be 2 because two numbers need to be added to the array (5 and 7) to make it a consecutive array of numbers from 4 to 8. Negative numbers may be entered as parameters and no array will have less than 2 elements. 

Use the Parameter Testing feature in the box below to test your code with different arguments.
=end

def consecutive(array)
  difference = array.max - array.min
  
  integers_between = []
  array.each do |number|
    if number.is_a?(Integer) && number.between?(array.min+1, array.max-1)
      integers_between << number
    end
  end

  difference - 1 - integers_between.length
end

p consecutive([4, 8, 6])