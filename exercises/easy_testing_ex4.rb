# require 'minitest/autorun'

# class Test_Class < MiniTest::Test
#   def test_value
#     list = [3, 4, 5]
#     # minitest only shows 1 assertion being present (should be 2), unless one
#     # of them is commented out (in which case it indicates 2 assertions !)

#     # assert_equal(true, list.empty?)
    assert_empty(list)
#   end
# end
