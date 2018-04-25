# Return uniqe elements, minimizing space requirements.
# Time complexity is O(nlogn), from sorting.
# Space complexity is O(logn) from the recursive calls of quick sort. 
# Apart from the sort call, space requirements are constant.
def uniq(arr)
  arr.sort!

  # Alters the array in place such that the first i elements of the array end
  # up being the final result that we want.
  i = 0
  0.upto(arr.length - 1) do |j|
    if arr[j] != arr[j+1]
      arr[i] = arr[j]
      i += 1
    end
  end

  # Delete extra elements using pop to ensure no extra space is used.
  # (Could be done with slice!, but I'm unsure if that uses extra space.)
  (arr.length - i).times { arr.pop }

  arr
end

if __FILE__ == $PROGRAM_NAME
  p uniq([1,3,1,3,5,1,4]) # [1,3,4,5]
end