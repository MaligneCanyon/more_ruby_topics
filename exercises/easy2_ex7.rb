# inputs:
# - arr
# - obj
# outputs:
# - obj
# reqs:
# - iterate thru an arr, passing each elem and an obj to a blk
# - rtn the obj
# rules:
# - nonw
# struct:
# - arr
# algo:
# - for each elem of the arr
#   - yield the elem and the obj to the blk
# - rtn the obj

def each_with_object(arr, obj)
  arr.each do |elem|
    yield(elem, obj)
  end
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}
