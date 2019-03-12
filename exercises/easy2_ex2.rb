# inputs:
# - arr x2
# output:
# - arr (nested)
# reqs:
# - take 2 input arrs
# - rtn a new arr where
#   - each elem is a 2-elem arr where
#     - the first elem is a value from the first input arr
#     - the second elem is a value from the second input arr
# rules:
# - both input arrs have the same num of elems
# struct:
# - arr
# algo:
# - init a new_arr to []
# - arr1.size times (ndx)
#   - add the nth elem from the input arrs to a sub_arr
#   - add the sub_elem to the new_arr
# - rtn the new_arr

# def zip(arr1, arr2)
#   new_arr = []
#   arr1.size.times do |ndx|
#     new_arr << [arr1[ndx], arr2[ndx]]
#   end
#   new_arr
# end

def zipper(arr1, arr2)
  arr1.map.with_index { |elem, ndx| [elem, arr2[ndx]] }
end

p zipper([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

arr1 = [1, 2, 3]
arr2 = [4, 5, 6]
p zipper(arr1, arr2) == [[1, 4], [2, 5], [3, 6]]
p arr1
p arr2
