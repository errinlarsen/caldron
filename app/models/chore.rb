class Chore
  attr_accessor :list, :name

  def initialize(attr={})
    attr.each { |attr, val| send( "#{attr}=", val) }
  end

  def write
    list.add_chore(self)
  end
end
