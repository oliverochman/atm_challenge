class Person
  attr_reader :name

  def initialize(name = nil)
    set_name(name)
  end
end

private

def set_name(name)
  @name = name
end
