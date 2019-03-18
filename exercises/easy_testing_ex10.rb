require 'minitest/autorun'

class Test_Class < MiniTest::Test
  def test_value
    list = ['abc', 'def'] # should pass, since 'xyz' is not incl'd
    # list = ['abc', 'def', 'xyz'] # should fail, since 'xyz' is incl'd
    refute_includes(list, 'xyz') # counts (incorrectly) as 2 assertions
  end
end
