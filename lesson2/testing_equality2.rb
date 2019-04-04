class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)               # assert_equal would fail w/o this method
    # other.is_a?(Car) && name == other.name
    other.instance_of?(Car) && name == other.name
  end
end


require 'minitest/autorun'

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kit"
    car2.name = "Kit"

    assert_equal(car1, car2)  # this will pass
    assert_same(car1, car2)   # this will fail
  end
end
