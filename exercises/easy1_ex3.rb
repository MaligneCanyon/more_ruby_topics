# inputs:
# - arr
# outputs:
# - arr
# reqs:
# - take a sorted arr of ints
# - return an arr consisting of the missing ints btwn arr.first and arr.last
# rules:
# - none
# struct:
# - arr
# algo:
# - init a new_arr to []
# - set num = arr.first
# - while num is < arr.last
#   - add num to the new_arr unless num is a elem in the arr
#   - incr num
# - rtn the new_arr


def missing(arr)
  new_arr = []
  num = arr.first
  while num < arr.last
    new_arr << num unless arr.include?(num)
    num += 1
  end
  new_arr
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
