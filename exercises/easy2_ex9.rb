# inputs:
# - arr
# - blk
# outputs:
# - nil
# reqs:
# - iterate thru the arr, taking 2 consecutive arr elems at the time
# - yield the elems to the blk
# - rtn nil
# rules:
# - should yield arr.size - 1 elem pairs to the blk
# algo:
# - init an ndx to 0
# - while the ndx is < arr.size - 1
#   - yield the current and next arr elems to the blk
#   - incr the ndx
# - rtn nil

def each_cons(arr)
  ndx = 0
  while ndx < arr.size - 1
    yield(arr[ndx], arr[ndx + 1])
    ndx += 1
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }
p result == nil

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
