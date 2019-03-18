require 'minitest/autorun'

class NoExperienceError < StandardError; end
class Employee
  def hire
    raise NoExperienceError, "no experience"
  end
end

class Test_Class < MiniTest::Test
  def test_value
    exception = assert_raises(NoExperienceError) do
      employee = Employee.new
      employee.hire
    end
    puts exception.message
  end
end
