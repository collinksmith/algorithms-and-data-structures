def merge_sort(array)
  res = []
  if array.size <= 1
    return array
  else
    left = merge_sort(array[0...(array.size/2)])
    right = merge_sort(array[(array.size/2)..-1])
  end

  idx1 = 0
  idx2 = 0
  while idx1 < left.size || idx2 < right.size
    if idx1 < left.size && idx2 < right.size
      if left[idx1] < right[idx2]
        res << left[idx1]
        idx1 += 1
      else
        res << right[idx2]
        idx2 += 1
      end
    elsif idx1 < left.size
      res << left[idx1]
      idx1 += 1
    else
      res << right[idx2]
      idx2 += 1
    end
  end

  res
end

p merge_sort([5,1,2,7,3,8,2,-90,103])