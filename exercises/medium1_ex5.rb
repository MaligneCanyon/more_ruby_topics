items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)
gather(items) do |*elems, last_elem|
  puts elems.join(', ')
  puts last_elem
end
puts
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)
gather(items) do |first_elem, *elems, last_elem|
  puts first_elem
  puts elems.join(', ')
  puts last_elem
end
puts
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)
gather(items) do |first_elem, *elems|
  puts first_elem
  puts elems.join(', ')
end
puts
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)
gather(items) do |first_elem, second_elem, third_elem, last_elem|
  puts [[first_elem, second_elem, third_elem].join(', '), last_elem].join(', and ')
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
