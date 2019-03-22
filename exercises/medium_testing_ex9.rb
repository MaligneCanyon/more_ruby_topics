require 'minitest/autorun'

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
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
  def test_swap
    old_str = @file.read
    # old_str =
    #   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    #   Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    #   quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    #   nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    #   dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    #   et varius mauris, at pharetra mi."
    # p old_str
    new_str = <<~TEXT # strip away leading whitespace
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    TEXT
    # p new_str
    @text_obj = Text.new(old_str)
    assert_equal(new_str, @text_obj.swap('a', 'e'))
  end
end
