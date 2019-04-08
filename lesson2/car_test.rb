# car_test.rb (assert-flavoured Minitest)

# load all the necessary files from the Minitest gem
require 'minitest/autorun'

# add colour (and additional formatting) to the Minitest output
require "minitest/reporters"
Minitest::Reporters.use! # comment out to use the default output format

# require the file that we're testing, car.rb, which contains the Car class
# use require_relative to specify the file name from the current file's directory
require_relative 'car'

# create our test class
# this class must subclass from MiniTest::Test;
# this will allow our test class to inherit all the necessary methods for writing tests
class CarTest < MiniTest::Test
  # w/i our test class, write tests by creating an instance method that starts with "test_";
  # Minitest will know that these methods are individual tests that need to be run
  def test_wheels
    # w/i each test (each instance method that starts with "test_"), we need to make some assertions;
    # these assertions are what we are trying to verify
    # we first have to set up the appropriate data or objs to make assertions against

    # we first instantiate a Car obj
    car = Car.new
    # we then use this Car obj in our assertion to verify that newly created Car objs indeed have
    # 4 wheels
    assert_equal(4, car.wheels) # assert_equal is an inherited instance method
  end

  def test_bad_wheels # designed to fail
    skip "skipping test_bad_wheels" # skips the test; msg is optional
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
