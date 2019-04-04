# better to rtn T or F based on whether the input args are valid ?
# ... want to avoid an infinite loop
def step(starting, ending, step)
  return false if starting > ending || step <= 0
  num = starting
  while num <= ending
    yield num
    num += step
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
p step(1, 1, 0)   { |value| puts "value = #{value}" } # => false
