# inputs:
# - arr
# - blk
# outputs:
# - int (max arr value as def'd by the blk)
# reqs:
# - iterate thru an arr, passing each elem to a blk
# - rtn max value returned by the blk
# rules:
# - none
# struct:
# - arr
# algo:
# - init a max_value and max_index to nil
# - for each elem and ndx of the arr
#   - yield the elem to the blk
#   - if the max_value == nil or the rtn value > max_value
#     - replace the max_value with the rtn_value from the blk
#     - set the max_ndx to the corresponding arr ndx
# - rtn the arr value at the max arr ndx

# def max_by(arr)
#   max_value = nil
#   max_ndx = nil
#   arr.each_with_index do |elem, ndx|
#     rtn_value = yield(elem)
#     if max_value == nil || rtn_value > max_value
#       max_value = rtn_value
#       max_ndx = ndx
#     end
#   end
#   return arr.empty? ? nil : arr[max_ndx]
# end

def max_by(arr)
  return nil if arr.empty?
  new_arr = []
  arr.each do |elem|
    new_arr << yield(elem)
  end
  ndx = new_arr.index(new_arr.max) # the ndx of the max value in the new_arr
  arr[ndx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

# ('0'..'9').each { |char| p char.ord } # 48..57
