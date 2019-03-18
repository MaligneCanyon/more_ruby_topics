require 'minitest/autorun'

class Test_Class < MiniTest::Test
  def test_value
    value = 3
    assert(value.odd?, "value is not odd")
  end
end
