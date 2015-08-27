def sort_and_count(array)
  n = array.length
  front_array = array[0...(n/2)]
  back_array = array[(n/2)..-1]

  if n == 1
    return array, 0
  else
    front_sorted, front_count = sort_and_count(front_array)
    back_sorted, back_count = sort_and_count(back_array)
    full_array, split_count = merge_and_count_split_inv(front_sorted, back_sorted)
  end

  return full_array, split_count + front_count + back_count
end

def merge_and_count_split_inv(front_array, back_array)
  res = []
  split_count = 0

  length = front_array.length + back_array.length
  i = 0
  j = 0
  length.times do
    if j >= back_array.length
      res << front_array[i]
      i += 1
    elsif i >= front_array.length
      res << back_array[j]
      j += 1
    elsif front_array[i] <= back_array[j]
      res << front_array[i]
      i += 1
    else
      res << back_array[j]
      j += 1
      split_count += (front_array.length - i)
    end
  end

  return res, split_count
end

p sort_and_count([3,2,1,6,5,4])