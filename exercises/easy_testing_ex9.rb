require 'minitest/autorun'

class List
  def process
    self.class.new # should fail
    self # should pass
  end
end

class TestClass < MiniTest::Test
  def test_value
    list = List.new
    assert_same(list, list.process)
  end
end
