require 'minitest/autorun'

class List
  def process
    self.class.new # should fail; #process rtns a dif instance
    # self # should pass; #process rtns the same instance
  end
end

class Test_Class < MiniTest::Test
  def test_value
    list = List.new
    assert_instance_of(List, list)
    assert_instance_of(List, list.process)
    # assert_equal(list, list.process) # List#== compares obj equality at the obj level
    assert_same(list, list.process)
  end
end
