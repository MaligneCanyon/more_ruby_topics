# def an each method w/ an Array arg
# should be v.sim to Array#each
# all we are responsible for is to yield to the blk and pass it the current arr elem
# our each method is solely focused on iterating and nothing beyond that
def each(arr)
  ndx = 0
  while ndx < arr.size do
    yield(arr[ndx])
    ndx += 1
  end
  arr
end

rtnval =
each([1, 2, 3]) { |num| "do nothing" }                           # still returns [1, 2, 3]
puts "# => #{rtnval}"

rtnval =
each([1, 2, 3]) {|num| "do nothing"}.select{ |num| num.odd? }    # => [1, 3]
puts "# => #{rtnval}"

rtnval =
each([1, 2, 3, 4, 5]) do |num|
  puts num
end
puts "# => #{rtnval}"
