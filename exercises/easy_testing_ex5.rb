require 'minitest/autorun'

class Test_Class < MiniTest::Test
  def test_value
    list = ['abc', 'def']
    assert_includes(list, 'xyz') # counts (incorrectly) as 2 assertions
  end
end