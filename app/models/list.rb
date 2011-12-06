class List
  attr_accessor :board, :date, :title
  attr_reader :chores
  attr_writer :chore_maker

  def initialize(attrs={})
    attrs.each { |attr, val| send("#{attr}=", val) }
    @chores = []
  end

  def post
    board.add_list(self)
  end

  def new_chore
    chore_maker.call.tap do |new_chore|
      new_chore.list = self
    end
  end


  private
  def chore_maker
    @chore_maker ||= Chore.public_method(:new)
  end
end
