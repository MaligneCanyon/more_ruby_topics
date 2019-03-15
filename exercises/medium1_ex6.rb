def convert_to_base_8(n)
  # n.method_name.method_name # replace these two method calls
  n.to_s(8).to_i
end

# The correct type of argument must be used below
# base8_proc = method(argument).to_proc
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
# [8, 10, 12, 14, 16, 33].map(&a_proc)
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# The expected return value of map on this number array should be:
[10, 12, 14, 16, 20, 41]


# You can apply the & operator to an object that contains a Method;
# in doing so, Ruby calls Method#to_proc
# So, the following is equivalent to lines 8 and 13 above
my_Method = method(:convert_to_base_8)
p [8, 10, 12, 14, 16, 33].map(&my_Method) # [10, 12, 14, 16, 20, 41]


p my_Method.class.name # "Method"


# Note: we have effectively converted a method
def convert_to_base_8(n)
  n.to_s(8).to_i
end
# to a proc
Proc.new { |n| n.to_s(8).to_i }
# to a block
[8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }
