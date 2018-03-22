def insertion_sort(array)
  1.upto(array.length-1) do |i|
    i.downto(1) do |j|
      if array[j-1] > array[j]
        temp = array[j]
        array[j] = array[j-1]
        array[j-1] = temp
      else
        break
      end
    end
  end    
  array
end

p insertion_sort([5,4,6,1,3])