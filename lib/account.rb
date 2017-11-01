class Account
  attr_accessor :pin_code, :balance, :exp_date, :owner, :account_status

  STANDARD_VALIDITY_YRS = 5

  def initialize(attrs = {})
    @pin_code = genererate_pin
    @balance = 0
    @account_status = :active
    @exp_date = set_expire_date
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end

  def genererate_pin
    rand(1000..9999)
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end
end
