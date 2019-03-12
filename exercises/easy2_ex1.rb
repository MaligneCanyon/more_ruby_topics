# better to rtn T or F based on whether the input args are valid ?
# ... want to avoid an infinite loop
def step(start, finish, delta)
  return false if start < finish && delta <= 0 || start > finish && delta >= 0
  value = start
  while value <= finish
    yield value
    break if start == finish
    value += delta
  end
  true
end

p step(1, 10, 3)  { |value| puts "value = #{value}" } # => true
# value = 1
# value = 4
# value = 7
# value = 10
p step(1, 10, -3) { |value| puts "value = #{value}" } # => false
p step(10, 1, 3)  { |value| puts "value = #{value}" } # => false
p step(10, 1, -3) { |value| puts "value = #{value}" } # => true
# value = 10
# value = 7
# value = 4
# value = 1
p step(1, 1, 0)   { |value| puts "value = #{value}" } # => true
# value = 1
