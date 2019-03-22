require 'minitest/autorun'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

class TextTest < MiniTest::Test
  def setup
    @file = File.open("./sample.txt", "r") # good idea to spec the filepath
  end

  def teardown
    @file.close
  end

  # keep things directly related to our test in the test method
  def test_word_count
    # old_str = @file.read
    # @text_obj = Text.new(old_str)
    # assert_equal(72, @text_obj.word_count)
    assert_equal(72, Text.new(@file.read).word_count)
  end
end
