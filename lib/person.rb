class Person
  attr_reader :name, :account
  attr_accessor :cash

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

  def missing_account
    raise 'No account present'
  end
end
