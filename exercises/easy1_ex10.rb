# def count(arr)
#   counter = 0
#   arr.each do |elem|
#     counter += 1 if yield(elem)
#   end
#   counter
# end

# alt version w/o each, loop, while, or until
def count(arr)
  new_arr = []
  arr.select do |elem|
    new_arr << elem if yield(elem)
  end
  new_arr.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
