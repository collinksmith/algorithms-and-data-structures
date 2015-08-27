=begin
Title: Remove Duplicates from Sorted Array
Difficulty: Easy
Percent correct: 31.5%

Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.


Do not allocate extra space for another array, you must do this in place with constant memory.



For example,
Given input array A = [1,1,2],


Your function should return length = 2, and A is now [1,2].
  Show Tags          Array        Two Pointers
=end

def remove_duplicates(array)
  idx1 = 0
  while idx1 < array.length
    current = array[idx1]
    
    idx2 = idx1 + 1
    while idx2 < array.length
      if array[idx2] == current
        array.delete_at(idx2)
        idx2 -= 1
      end

    idx2 += 1
    end

  idx1 += 1
  end

  p array
  array.length
end

p remove_duplicates([1,1,2])
p remove_duplicates([1,3,5,7,9])
p remove_duplicates([1,2,3,2,6,2,2,9,10,10])
