# Sort array using quick sort and calculate number of operations performed.
# Performs the sort in place (O(1) space).
def quick_sort_comparisons(arr, l = 0, r = arr.length - 1)
  return [arr, 0] if (l >= r || arr.length <= 1)
  new_l, mid, new_r = partition_best_of_three(arr, l, r)
  comp = r - l
  _, comp_rec_l = quick_sort_comparisons(arr, new_l, mid - 1)
  _, comp_rec_r = quick_sort_comparisons(arr, mid + 1, new_r)
  total_comp = comp_rec_l + comp_rec_r + comp
  [arr, total_comp]
end

def partition(arr, l, r, pivot)
  i = l + 1

  (l + 1).upto(r) do |j|
    if arr[j] <= pivot
      arr[j], arr[i] = arr[i], arr[j]
      i += 1
    end
  end

  arr[l], arr[i - 1] = arr[i - 1], arr[l]
  [l, i - 1, r]
end

# Use the first element as the pivot.
def partition_first(arr, l, r)
  pivot = arr[l]
  partition(arr, l, r, pivot)
end

# Use the last element as the pivot.
def partition_last(arr, l, r)
  pivot = arr[r]
  arr[l], arr[r] = arr[r], arr[l]
  partition(arr, l, r, pivot)
end

# Look at the first, middle, and last elements and use the middle value as the pivot.
def partition_best_of_three(arr, l, r)
  mid_idx = l + ((r - l) / 2)
  possible_pivots = [[l, arr[l]], [mid_idx, arr[mid_idx]], [r, arr[r]]]
  pivot_idx, pivot = possible_pivots.sort_by { |i| i[1] }[1]
  arr[l], arr[pivot_idx] = arr[pivot_idx], arr[l]
  partition(arr, l, r, pivot)
end

arr = [6,1,5,2,7,0,15,-5,3]
sorted = quick_sort_comparisons(arr)
p sorted[0]
p sorted[1]
