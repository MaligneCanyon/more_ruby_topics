# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc #<Proc:0x00000000025fc678@advanced1_ex2.rb:2> # lists R. filename
puts my_proc.class # Proc
my_proc.call # This is a .
my_proc.call('cat') # This is a cat.
# procs do not chk the num of args


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." } # alt def'n syntax
puts my_lambda
#<Proc:0x000000000238c398@advanced1_ex2.rb:10 (lambda)> # still a Proc obj ?
puts my_second_lambda
#<Proc:0x000000000238c398@advanced1_ex2.rb:10 (lambda)>
puts my_lambda.class # Proc
my_lambda.call('dog') # This is a dog.
# my_lambda.call # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # NameError (re: 'Lambda')
Lambdas are really just Procs w/ arg chking ?


# Group 3
def block_method_1(animal)
  yield
end
block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a .
block_method_1('seal') # LocalJumpError (no block given)
# for methods def'd to accept an implicit block,
# - the num of args yielded in the imp should match the num of block params in the invoc
# - the invoc must incl a block


# Group 4
def block_method_2(animal)
  yield(animal)
end
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # This is a turtle and a .
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError (re: 'animal')
# comments as per Group 3
