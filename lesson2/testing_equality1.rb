require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2) # passes, same value
    assert_same(str1, str2) # fails, dif objs
  end
end
