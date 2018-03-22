def permutation(array)
  return array if array.length < 2

  perm = []
  array.each do |e|
    (array - [e]).permutation.each do |p|
      perm << ([e] + p)
    end
  end

  perm
end

p permutation([1,2,3,4])