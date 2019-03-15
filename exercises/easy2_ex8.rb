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
