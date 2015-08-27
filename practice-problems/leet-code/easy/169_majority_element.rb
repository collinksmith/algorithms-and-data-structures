=begin
Title: Majority Element
Difficulty: Easy
Percent correct: 34.5%

Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.
=end

def majority_element(array)
  elements = Hash.new(0)
  array.each do |element|
    elements[element] += 1
    return element if elements[element] > array.length/2
  end

  -1
end

p majority_element([1,1,1,2,2,2,2,2,3])