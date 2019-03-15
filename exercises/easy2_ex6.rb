# def each_with_index(arr)
#   ndx = 0
#   while ndx < arr.size do
#     yield(arr[ndx], ndx)
#     ndx += 1
#   end
#   arr
# end

def each_with_index(arr)
  ndx = 0
  arr.each do |elem|
    yield(elem, ndx)
    ndx += 1
  end
  # arr # Array.each rtns the original collection
end



result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end
puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
