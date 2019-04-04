# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc #<Proc:0x00000000025fc678@advanced1_ex2.rb:2> # lists R. filename and line of code
puts my_proc.class # Proc
my_proc.call # This is a .
my_proc.call('cat') # This is a cat.
# procs do not chk the num of args


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." } # alt def'n syntax
puts my_lambda
#<Proc:0x00000000016e2408@advanced1_ex2.rb:11 (lambda)> # still a type of Proc obj ...
puts my_second_lambda
#<Proc:0x00000000016e23e0@advanced1_ex2.rb:12 (lambda)> # ... displays Proc type as 'lambda'
puts my_lambda.class # Proc
my_lambda.call('dog') # This is a dog.
my_lambda.call # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # NameError (re: 'Lambda');
# we can't create a lambda using Lambda.new
# lambdas are really just Procs w/ arg chking ?


# Group 3
# Note: nothing is yielded to the blk in the method implementation
def block_method_1(animal)
  yield
end
block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a .
block_method_1('seal') # LocalJumpError (no blk given)
# for methods def'd to accept an implicit block,
# - the num of args yielded in the imp should match the num of block params in the invoc
# - the invoc must incl a blk


# Group 4
def block_method_2(animal)
  yield(animal)
end
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # This is a turtle and a .
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError (undef'd local var 'animal')
# comments as per Group 3
