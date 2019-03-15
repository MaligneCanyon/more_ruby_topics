require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do # uses the 'describe' method
  it 'has 4 wheels' do # uses the 'it' method
    car = Car.new
    car.wheels.must_equal 4 # this is the expectation
  end
end
