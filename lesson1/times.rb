# def an xtimes method for the Integer class
# xtimes should be identical to Interger#times

# class Integer
#   def xtimes
#     (0...self).each do |n|
#       yield(n)
#     end
#     self
#   end
# end

# rtnval =
# 5.xtimes do |num|
#   puts num
# end
# puts "# => #{rtnval}"


# def a times method w/ integer args
# times should be v.sim to Interger#times
# all we are responsible for is to yield to the blk and pass it the current number
def times(x)
  (0...x).each do |n|
    yield(n)
  end
  x
end

rtnval =
times(5) do |num|
  puts num
end
puts "# => #{rtnval}"
