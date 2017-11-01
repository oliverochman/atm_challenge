class Account
  attr_accessor :pin_code

  def initialize
    @pin_code = genererate_pin
  end

  private

  def genererate_pin
    rand(1000..9999)
  end
end
