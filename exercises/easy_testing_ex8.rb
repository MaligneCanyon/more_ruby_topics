require 'minitest/autorun'

class Test_Class < MiniTest::Test
  def test_value
    value = 'hi' # should fail
    # value = 4 # should pass; value is an Integer, which subclasses from Numeric
    # value = Numeric.new # should pass
    assert_kind_of(Numeric, value)
  end
end
