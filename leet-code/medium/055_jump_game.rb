=begin
Title: Jump Game
Difficulty: Medium
Percent correct: 27.3%

Given an array of non-negative integers, you are initially positioned at the first index of the array.


Each element in the array represents your maximum jump length at that position. 


Determine if you are able to reach the last index.



For example:
A = [2,3,1,1,4], return true.


A = [3,2,1,0,4], return false.
  Show Tags          Array        Greedy
=end

def jump_game(array)
  if array.length == 1
    return true
  elsif array.first == 0
    return nil
  end

  (array.first).downto(1) do |i|
    next if i > array.length - 1
    if jump_game(array[i..-1]) == true
      return true
    end
  end

  return false
end

p jump_game([2,3,1,1,4])
p jump_game([3,2,1,0,4])
p jump_game([2,0,1,3,0])
p jump_game([2,3,0,3,1,0])