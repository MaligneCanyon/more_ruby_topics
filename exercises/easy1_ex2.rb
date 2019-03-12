def compute
  block_given? ? yield : 'Does not compute.'
end

# Examples:
p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def xcompute(arg1)
  block_given? ? yield(arg1) : 'Does not compute.'
end

p xcompute(1) { |value| value + 5 + 3 } == 9
p xcompute('j') { |value| value + 'a' + 'b' } == 'jab'
p xcompute(4.2) == 'Does not compute.'
