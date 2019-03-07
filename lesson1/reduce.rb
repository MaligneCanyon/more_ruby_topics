# def a reduce method w/ an Array arg and an optional initial accum value
# should be v.sim to Enumerable#reduce
# we are responsible for
# - initializing the accumulator to an (optional) input value (default == 0)
#   if arr[0] is an Integer
# - yielding to the blk and passing it an accumulator and the current arr elem
# - saving the blk rtnval in the accumulator
# - returning the accumulated value
def reduce(arr, init = 0) # default initial accum value is 0
  accum = case arr[0].class.name
          when "String" then ''
          when "Array"  then []
          else init
          end
  ndx = 0
  while ndx < arr.size do # could use Array#each instead of a while loop
    accum = yield(accum, arr[ndx])
    ndx += 1
  end
  accum
end

# rtnval =
# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end
# puts "# => #{rtnval}" # => 6

rtnval =
reduce([1, 2, 3]) do |acc, num|
  acc + num
end
puts "# => #{rtnval}" # => 6

rtnval =
reduce([2, 3, 4], 1) do |acc, num| # use 1 as initial accum value for multiplication
  acc * num
end
puts "# => #{rtnval}" # => 24

array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }             # => 15
p reduce(array, 10) { |acc, num| acc + num }         # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? } # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
