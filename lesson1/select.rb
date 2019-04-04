# def a select method w/ an Array arg
# should be v.sim to Array#select
# we are responsible for
# - yielding to the blk and passing it the current arr elem
# - saving the arr elem if the blk rtns T
# - returning the saved arr elems in a new arr

# def select(arr)
#   new_arr = []
#   ndx = 0
#   while ndx < arr.size do # could use Array#each instead of a while loop
#     new_arr << arr[ndx] if yield(arr[ndx])
#     ndx += 1
#   end
#   new_arr
# end

def select(arr)
  new_arr = []
  arr.each do |elem|
    new_arr << elem if yield(elem)
  end
  new_arr
end

array = [1, 2, 3, 4, 5]

rtnval =
select(array) { |num| num.odd? }      # => [1, 3, 5]
puts "# => #{rtnval}"

rtnval =
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
puts "# => #{rtnval}"

rtnval =
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
puts "# => #{rtnval}"
