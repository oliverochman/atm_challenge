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
end
