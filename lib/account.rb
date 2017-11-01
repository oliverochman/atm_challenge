class Account
  attr_accessor :pin_code, :balance

  def initialize
    @pin_code = genererate_pin
    @balance = 0
  end

  private

  def genererate_pin
    rand(1000..9999)
  end
end
