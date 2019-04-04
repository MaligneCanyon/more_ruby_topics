require 'minitest/autorun'

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def miaow
    "#{name} is miaowing."
  end
end


class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_miaow
    # assert_equal(@kitty.name, 'Milo')
    # assert_equal('Milo', @kitty.name)
    # assert(@kitty.name == 'Milo')
    refute_equal('Kitty', @kitty.name)
  end
end
