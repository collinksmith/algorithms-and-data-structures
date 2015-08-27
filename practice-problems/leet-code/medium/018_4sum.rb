=begin
Title: 4Sum
Difficulty: Medium
Percent correct: 21.4%

Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

Note:

Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d)
The solution set must not contain duplicate quadruplets.




    For example, given array S = {1 0 -1 0 -2 2}, and target = 0.

    A solution set is:
    (-1,  0, 0, 1)
    (-2, -1, 1, 2)
    (-2,  0, 0, 2)
  Show Tags          Array        Hash Table        Two Pointers
=end

def two_sum(array, target)
  result = []

  (0...(array.length-1)).each do |first|
    ((first + 1)...array.length).each do |second|
      first_num = array[first]
      second_num = array[second]
      if first_num + second_num == target
        result << [first_num, second_num].sort
      end
    end
  end

  result
end

def three_sum(array, target)
  result = []

  (0...(array.length-2)).each do |first|
    ((first + 1)...array.length-1).each do |second|
      first_num = array[first]
      
      two_sum_target = target - first_num
      two_sums = two_sum(array[second..-1], two_sum_target)

      two_sums.each do |two_sum|
        if two_sum.inject(:+) + first_num == target
          result << [first_num, two_sum[0], two_sum[1]].sort
        end
      end
    end  
  end

  result
end

def four_sum(array, target)
  result = []

  (0...(array.length-3)).each do |first|
    ((first + 1)...(array.length - 2)).each do |second|
      first_num = array[first]

      three_sum_target = target - first_num
      three_sums = three_sum(array[second..-1], three_sum_target)

      three_sums.each do |three_sum|
        if three_sum.inject(:+) + first_num == target
          result << [first_num, three_sum[0], three_sum[1], three_sum[2]].sort
        end
      end
    end
  end

  result.uniq
end

# p two_sum([1, 0, -1, 0, -2, 2], 0)
# p three_sum([1, 0, -1, 0, -2, 2], 0)
p four_sum([1, 0, -1, 0, -2, 2], 0)