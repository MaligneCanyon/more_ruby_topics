items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  # puts "#{items.join(', ')}"
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join(', ').capitalize + '.' }
