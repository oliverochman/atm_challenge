class Account
  attr_accessor :pin_code, :balance, :exp_date, :account_status

  def initialize
    @pin_code = genererate_pin
    @balance = 0
    @account_status = :active
    @exp_date = future_date
  end

  private

  def genererate_pin
    rand(1000..9999)
  end

  def future_date
    Date.today.next_year(5).strftime("%m/%y")
  end
end
