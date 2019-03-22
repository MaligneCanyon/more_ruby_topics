require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @item_cost = 10
    @xaction = Transaction.new(@item_cost)
    @change = 5
    # p @xaction
  end

  def test_prompt_for_payment
    input_str = StringIO.new("#{@item_cost + @change}\n") # sim input from stdin
    # Transaction#prompt_for_payment will call StringIO#gets on the input_str
    @xaction.prompt_for_payment(input: input_str)
    assert_equal(@item_cost + @change, @xaction.amount_paid)
  end
end
