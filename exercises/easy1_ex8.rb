# def none?(arr)
#   arr.each do |elem|
#     return false if yield(elem)
#   end
#   true
# end

def any?(arr)
  arr.each do |elem|
    return true if yield(elem)
  end
  false
end

def none?(arr, &blk) # explicity reqs a blk and converts it to a Proc obj
  !any?(arr, &blk) # takes a Proc obj as an arg and converts it to a blk
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
