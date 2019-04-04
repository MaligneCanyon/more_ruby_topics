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

  def test_change
    assert_equal(@change, @register.change(@xaction))
  end
end

  # def change(transaction)
  #   transaction.amount_paid - transaction.item_cost
  # end
