
def welcome(str)
  puts "#{str} #{yield}"  # missing code
end

welcome('Hello') { 'there' } # => Hello there
welcome('Hey') { 'Joe' } # => Hey Joe
