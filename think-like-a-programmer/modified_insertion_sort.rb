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

# The goal of this modified insertion sort is to ignore values of -1 and leave
# them in their place, while sorting all the other values.
def modified_insertion_sort(array)
  1.upto(array.length-1) do |i|
    unless array[i] == -1
      rightswap = i

      (i-1).downto(0) do |leftswap|
        if array[leftswap] != -1 && array[leftswap] > array[rightswap]
          temp = array[leftswap]
          array[leftswap] = array[rightswap]
          array[rightswap] = temp
          rightswap = leftswap
        elsif array[leftswap] != -1
          break
        end
      end
    end
  end    
  array
end

p modified_insertion_sort([87,-1,-1,84,-1,72])