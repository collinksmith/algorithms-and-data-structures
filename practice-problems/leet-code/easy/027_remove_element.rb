=begin
Title: Remove Element
Difficulty: Easy
Percent correct: 32.4%

Given an array and a value, remove all instances of that value in place and return the new length.



The order of elements can be changed. It doesn't matter what you leave beyond the new length.
  Show Tags          Array        Two Pointers
=end

def remove_element(array, value)
  i = 0
  while i < array.length
    if array[i] == value
      array.delete_at(i)
      i -= 1
    end

  i += 1
  end

  array.length
end

p remove_element([1,2,2,4,2,6,2], 2)
p remove_element([1,3,5,7,8], 4)