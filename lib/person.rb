require './lib/atm'
require './lib/account'


class Person
  attr_accessor :cash, :name, :account

  def initialize(name = nil)
    set_name(name)
    @cash = 0
    @account = nil
  end

  def create_account
    @account = Account.new({owner: self})
  end

  def deposit(amount)
    if @account.nil?
      missing_account
    else
      deposit_cash(amount)
    end
  end

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(args)
  end

  private

  def set_name(name)
    if name == nil
      missing_name
    else
      @name = name
    end
  end

  def missing_name
    raise 'A name is required'
  end

  def deposit_cash(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def missing_account
    raise RuntimeError, 'No account present'
  end

  def missing_atm
    raise RuntimeError, 'An ATM is required'
  end
end
