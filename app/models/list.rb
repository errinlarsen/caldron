class List
  extend ActiveModel::Naming
  include ActiveModel::Conversion

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

  def new_chore(*args)
    chore_maker.call(*args).tap do |new_chore|
      new_chore.list = self
    end
  end

  def add_chore(chore)
    chores << chore
  end

  # for ActiveModel
  def persisted?
    false
  end


  private
  def chore_maker
    @chore_maker ||= Chore.public_method(:new)
  end
end
