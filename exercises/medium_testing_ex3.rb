# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# require "minitest/reporters"
# Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @item_cost = 10
    @xaction = Transaction.new(@item_cost)
    @xaction.amount_paid = @item_cost
    # p @xaction
  end

  def test_accept_money
    initial_money = @register.total_money
    assert_equal(initial_money + @xaction.amount_paid, @register.accept_money(@xaction))
  end
end

  # def accept_money(transaction)
  #   @total_money += transaction.amount_paid
  # end
