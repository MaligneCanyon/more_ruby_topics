require 'minitest/autorun'

class Test_Class < MiniTest::Test
  def test_value
    # value = 4 # should fail; value is an Integer, not a Numeric
    value = Numeric.new # should pass
    assert_instance_of(Numeric, value)
  end
end
