require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @item_cost = 10
    @xaction = Transaction.new(@item_cost)
    @change = 5
    @xaction.amount_paid = @item_cost + @change
    # p @xaction
  end

  # def test_accept_money
  #   initial_money = @register.total_money
  #   assert_equal(initial_money + @xaction.amount_paid, @register.accept_money(@xaction))
  # end

  # def test_change
  #   assert_equal(@change, @register.change(@xaction))
  # end

  def test_give_receipt
    assert_nil(@register.give_receipt(@xaction))
    assert_output("You've paid $#{@xaction.item_cost}.\n") { @register.give_receipt(@xaction) }
  end
end

  # def give_receipt(transaction)
  #   puts "You've paid $#{transaction.item_cost}."
  # end
