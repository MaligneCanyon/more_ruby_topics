# inputs:
# - arr
# - blk
# outputs:
# - arr
# reqs:
# - iterate thru an arr
# - rtn the 1st elem that yields a F value and all subsequent elems (in a new arr)
# rules:
# - none
# struct:
# - arr
# algo:
# - for each elem of the arr
#   - yield the elem to the blk
#   - if the blk rtns F
#     - rtn the elem and remaining elems

def drop_while(arr)
  arr.each_with_index do |elem, ndx|
    return arr[ndx..-1] unless yield(elem)
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
