class Account
  attr_accessor :pin_code, :balance, :exp_date, :account_status

  STANDARD_VALIDITY_YRS = 5

  def initialize
    @pin_code = genererate_pin
    @balance = 0
    @account_status = :active
    @exp_date = set_expire_date
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def genererate_pin
    rand(1000..9999)
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end
end
